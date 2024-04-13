# semantic-segmentation
- In this project, I labeled the pixels of a road in images using a Fully Convolutional Network (FCN).
Basically with minor adjustments, I just implemented the code in the `main.py` module  from the
[original repository](https://github.com/udacity/CarND-Semantic-Segmentation/)
which are indicated with "TODO" comments . 
- The network architecture (Using Layer 3, 4, 7 from vgg and having skip connections and upsampling)
are copied from examples and recommendation from the Udacity lectures
- The `strides` and `kernel_size` for convolutional transpose layers are also copied from the lectures

# Results
- An important point to note is, batch size and learning rate are linked. If the batch size is too small then the gradients will become more unstable and would need to reduce the learning rate. However, based on my trials a batch size of one performed better than a batch size of two.
- I did two trial passes with a `dropout = 0.5` and `dropout = 0.75`  with the following parameters

```
EPOCHS = 20
BATCH_SIZE = 1

LEARNING_RATE = 0.0001
DROPOUT = 0.75
```
### I found that the second trial yields better results 
![comparision image](https://github.com/mithi/semantic-segmentation/blob/master/comparison_img.png)

### The second trial yields the following average training losses for each of the 20 epochs. 
![cost per epoch](https://github.com/mithi/semantic-segmentation/blob/master/cost_per_epoch.png)
```
[2.3693416085622716,
 0.69001412886649272,
 0.59445800005770888,
 0.32272798555120052,
 0.20092807057922688,
 0.16918183551218272,
 0.14278488861442024,
 0.1260949971096326,
 0.10738885418147777,
 0.095687169845902378,
 0.083679193695265941,
 0.07812522630171792,
 0.069632454269330388,
 0.062085022750249373,
 0.057057875424468808,
 0.074834771222309263,
 0.064260387193785407,
 0.069701109319976876,
 0.056181870239777137,
 0.049685901646408862]
```

# How to use

### Setup
##### Frameworks and Packages
Make sure the following is installed:
 - [Python 3](https://www.python.org/)
 - [TensorFlow](https://www.tensorflow.org/)
 - [NumPy](http://www.numpy.org/)
 - [SciPy](https://www.scipy.org/)

##### Dataset
Download the [Kitti Road dataset](http://www.cvlibs.net/datasets/kitti/eval_road.php) from [here](http://www.cvlibs.net/download.php?file=data_road.zip).  Extract the dataset in the `data` folder.  This will create the folder `data_road` with all the training a test images.

Run the following command to run the project:
```
$ nohup jupyter notebook &
```
And open `playground.ipynb` on your browser. `main.py` was generated from this notebook. 

# Shapes

- The following will be printed when you run `network_shapes()` in `playground.ipynb`
- IMPORTANT NOTE: that you wouldn't be able to run `run()` if you run `network_shapes()` without restarting the kernel
- `k` is the kernel/filter size and `s` being the stride
- Given a colored image of shape `n, 160, 576, 3` where `n = number of images = 1` the shape of each layer will be printed.
```
------------------
shapes of layers:
------------------
layer3 --> (1, 20, 72, 256)
layer4 --> (1, 10, 36, 512)
layer7 --> (1, 5, 18, 4096)
layer3 conv1x1 --> (1, 20, 72, 2)
layer4 conv1x1 --> (1, 10, 36, 2)
layer7 conv1x1--> (1, 5, 18, 2)
decoderlayer1 transpose: layer7 k = 4 s = 2 --> (1, 10, 36, 2)
decoderlayer2 skip: decoderlayer1 and layer4conv1x1 --> (1, 10, 36, 2)
decoderlayer3 transpose: decoderlayer2 k = 4 s = 2 --> (1, 20, 72, 2)
decoderlayer4 skip: decoderlayer3 and layer3conv1x1 --> (1, 20, 72, 2)
decoderlayer5 transpose: decoderlayer4 k = 16 s = 8 --> (1, 160, 576, 2)
```

# Related Links

##### Refresher of TensorFlow
- http://cv-tricks.com/artificial-intelligence/deep-learning/deep-learning-frameworks/tensorflow-tutorial/
- http://cv-tricks.com/tensorflow-tutorial/training-convolutional-neural-network-for-image-classification/
- https://danijar.com/structuring-your-tensorflow-models/

##### Semantic Segmentation
- http://blog.qure.ai/notes/semantic-segmentation-deep-learning-review
- http://cv-tricks.com/image-segmentation/transpose-convolution-in-tensorflow/
- https://www.youtube.com/watch?v=ByjaPdWXKJ4&t=1027s
- https://people.eecs.berkeley.edu/~jonlong/long_shelhamer_fcn.pdf

##### Transpose Convolution  
- https://arxiv.org/pdf/1603.07285.pdf
- http://deeplearning.net/software/theano/tutorial/conv_arithmetic.html#transposed-convolution-arithmetic
- https://github.com/vdumoulin/conv_arithmetic

# Optional things to do
##### Use custom weight initialization. Xavier init is also proposed to work good when working with FCNs.
##### Train and Inference on the cityscapes dataset instead of the Kitti dataset.
- https://www.cityscapes-dataset.com/

##### Augment Images for better results
- https://datascience.stackexchange.com/questions/5224/how-to-prepare-augment-images-for-neural-network


