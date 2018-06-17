[![Udacity - Robotics NanoDegree Program](https://s3-us-west-1.amazonaws.com/udacity-robotics/Extra+Images/RoboND_flag.png)](https://www.udacity.com/robotics)

## Deep Learning Project ##

In this project I used a fully-convolutional neural network to paint all pixels in an image which is part of a person. Two types of persons are identified, the “hero” target person, and everyone else. Identifying a specific person from everyone else are useful for “follow-me” operations of a drone. This is the final project for Udacity's Robotics Nanodegree Term 1. 

# ORIGINAL REPO
- https://github.com/udacity/RoboND-DeepLearning

# WRITEUP and other Requirements
- writeup: https://github.com/mithi/follow-me/blob/master/docs/WRITEUPV2.pdf
- model: https://github.com/mithi/follow-me/blob/master/data/weights/config_model_weights.h5
- weights: https://github.com/mithi/follow-me/blob/master/data/weights/model_weights.h5
- html: https://github.com/mithi/follow-me/blob/master/docs/model_training.html

# Jupyter Notebook 
- I ran this on Udacity Robotics Laboratory Community AMI in AWS 
- https://github.com/mithi/follow-me/blob/master/code/model_training.ipynb

# Images Used
- [New training Data](https://s3-us-west-1.amazonaws.com/udacity-robotics/Deep+Learning+Data/Lab/train.zip)
- [Validation Data](https://s3-us-west-1.amazonaws.com/udacity-robotics/Deep+Learning+Data/Lab/validation.zip)
- [Sample Evaluation Data](https://s3-us-west-1.amazonaws.com/udacity-robotics/Deep+Learning+Data/Project/sample_evaluation_data.zip)

[image_0]: ./docs/misc/sim_screenshot.png
![alt text][image_0] 

**Dependencies**

You'll need Python 3 and Jupyter Notebooks installed to do this project.  The best way to get setup with these if you are not already is to use Anaconda following along with the [RoboND-Python-Starterkit](https://github.com/udacity/RoboND-Python-StarterKit).

* Python 3.x
* Tensorflow 1.2.1
* NumPy 1.11
* SciPy 0.17.0
* eventlet 
* Flask
* h5py
* PIL
* python-socketio
* scikit-image
* transforms3d
* PyQt4/Pyqt5

**The data directory is organized as follows: **

```
data/runs - contains the results of prediction runs
data/train/images - contains images for the training set
data/train/masks - contains masked (labeled) images for the training set
data/validation/images - contains images for the validation set
data/validation/masks - contains masked (labeled) images for the validation set
data/weights - contains trained TensorFlow models

data/raw_sim_data/train/run1
data/raw_sim_data/validation/run1
```
