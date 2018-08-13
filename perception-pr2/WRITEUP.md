# WRITEUP

# Capturing features and Training Models for Object Detection
- There are eight types of objects: biscuits, soap, soap2, book, glue, sticky notes, snacks, and eraser. 
- To train the model, 
[**THIS SCRIPT**](https://github.com/mithi/perception-pr2/blob/master/src/sensor_stick/scripts/capture_features.py)
spawns each object in **100 random orientations** and computes features based on the point clouds 
resulting from each of the random orientations.
- The features are normalized histograms of the color and normal 3d vectors for each point in the point cloud
captured by the virtual RGBD camera. The color is expressed in **HSV** format, because they capture the true color better,
regardless of lighting conditions. The normal vectors for each point capture the shape of object. I used **64 bins**
for the histograms. They are normalized because it's the amount with respect to each other that matters not the actual amount. 
You can inspect the 
[**SCRIPT HERE**](https://github.com/mithi/perception-pr2/blob/master/src/sensor_stick/src/sensor_stick/features.py)
- I used 
[**THIS SCRIPT**](https://github.com/mithi/perception-pr2/blob/master/src/sensor_stick/scripts/train_svm.py)
to train the classifier which is a support vector machine classifier. 
- Check out the resulting confusion matrix below. 
![training result](https://github.com/mithi/perception-pr2/blob/master/img/confusion-matrix.png)

# Perception Pipeline
- You can inspect my
[**PERCEPTION PIPELINE SCRIPT HERE**](https://github.com/mithi/perception-pr2/blob/master/src/RoboND-Perception-Project/pr2_robot/scripts/project.py)


## Clean and Segment
- This is the `split_cloud` function
``` python
''' This pipeline separates the objects in the table from the given scene '''
def split_cloud(cloud):
  
  # Reduce noise by taking out statistical outliers
  reduced_noise_cloud = filter_statistical_outliers(point_cloud = cloud, mean = 20, stdev = 0.5)

  # Downsample the cloud as high resolution which comes with a computation cost
  downsampled_cloud = do_voxel_grid_filter(point_cloud = reduced_noise_cloud, LEAF_SIZE = 0.005)

  # Get only information in our region of interest as we don't care about the other parts
  roi_cloud = get_region_of_interest(downsampled_cloud)

  # Separate the table from everything else
  table_cloud, objects_cloud = do_ransac_plane_segmentation(point_cloud = roi_cloud, max_distance = 0.01)

  return objects_cloud, table_cloud
```
- First, I reduced the noise by filtering out statistical outliers. 
 The number of neighbors to analyze for each point is set to `mean = 20`, and the standard deviation multiplier to `0.5`. 
 What this means is that all points who have a distance larger than `0.5` standard deviation of the mean distance to the 
 query point will be marked as outliers and removed.
- After this, I downsample the resulting point cloud using a **voxel grid filter**.
The bigger the leaf size the less information is retained. As explained by Udacity's lectures, a voxel grid filter allows you to downsample the data by taking a spatial average of the points in the cloud confined by each voxel. 
You can adjust the sampling size by setting the voxel size along each dimension. 
The set of points which lie within the bounds of a voxel are assigned to that voxel and
statistically combined into one output point.
- After this, I get only the information in our region of interest by performing a **pass-through filter** in all three axes. 
The pass-through filter allows you to crop any given 3D point cloud by specifying an axis with cut-off values along that axis. 
```python
''' This pipeline performs three pass through filter in each cartesian axis '''
def get_region_of_interest(cloud):

  filtered_cloud_z = do_passthrough_filter(point_cloud = cloud, 
                                         name_axis = 'z', min_axis = 0.6, max_axis = 1.3)

  filtered_cloud_zx = do_passthrough_filter(point_cloud = filtered_cloud_z, 
                                         name_axis = 'x', min_axis = 0.3, max_axis = 1.0)

  filtered_cloud_zxy = do_passthrough_filter(point_cloud = filtered_cloud_zx, 
                                         name_axis = 'y', min_axis = -0.5, max_axis = 0.5)

  return filtered_cloud_zxy
```
- Lastly, to separate the table from the objects at the table top I use an algorithm called **RANSAC** or 
**RANDOM SAMPLE CONSENSUS**. This algorithm identify points in your dataset that belong to a particular model.
You can learn more about RANSAC here: https://www.youtube.com/watch?v=1YNjMxxXO-E
The max distance I used is 0.01. This is the distance threshold from away from the ideal perfect 
plane model which I still consider as part of the model.

## Cluster
![clusters](https://github.com/mithi/perception-pr2/blob/master/img/clusters.png)
-  To identify which points in a point cloud belong to the same object, I used the **DBSCAN  Algorithm** (Density-Based Spatial Clustering of Applications with noise) 
    aka Euclidian clustering to group points. 
    The idea is that if a particular point belongs to a cluster, it should be near to lots of other points in that cluster.
    The settings I used is largely based on trial and error.
    Below is a good discusion of this algorithm.
- - https://www.naftaliharris.com/blog/visualizing-dbscan-clustering/

## Recognize
- I used the model from trained model as discussed earlier. 

# Output YAML files
- [Test Scene 1](https://github.com/mithi/perception-pr2/blob/master/src/RoboND-Perception-Project/pr2_robot/scripts/output_1.yaml)
- [Test Scene 2](https://github.com/mithi/perception-pr2/blob/master/src/RoboND-Perception-Project/pr2_robot/scripts/output_2.yaml)
- [Test Scene 3](https://github.com/mithi/perception-pr2/blob/master/src/RoboND-Perception-Project/pr2_robot/scripts/output_3.yaml)

# Files 
- [Project script](https://github.com/mithi/perception-pr2/blob/master/src/RoboND-Perception-Project/pr2_robot/scripts/project.py)
- [Resulting Model](https://raw.githubusercontent.com/mithi/perception-pr2/master/src/RoboND-Perception-Project/pr2_robot/scripts/model.sav)
- [Capture Features Script](https://github.com/mithi/perception-pr2/blob/master/src/sensor_stick/scripts/capture_features.py)
- [Training Script](https://github.com/mithi/perception-pr2/blob/master/src/sensor_stick/scripts/train_svm.py)
- [Features Script](https://github.com/mithi/perception-pr2/blob/master/src/sensor_stick/src/sensor_stick/features.py)

# Results
![result](https://github.com/mithi/perception-pr2/blob/master/img/label_test3.png)
![result 1](https://github.com/mithi/perception-pr2/blob/master/img/test1.png)
![result 2](https://github.com/mithi/perception-pr2/blob/master/img/test2.png)
![result 3](https://github.com/mithi/perception-pr2/blob/master/img/test3.png)
- More screenshots can be found in the `/img` folder

# Reflections and Future Work
- My pipeline won't work in a lot of scenarios. Here are a few that comes into mind:
- - If the point cloud data is more noisy.
- - If the RGBD camera is placed differently then the region of interest will be different. 
- - If the objects to be recognized are not part of the classifier, then naturally they won't be recognized. 
- - I haven't tried to do the challenge, this is only the minimum required to pass. In the future if I have time, I can 
try making a pipeline for a more complex table top configuration.
