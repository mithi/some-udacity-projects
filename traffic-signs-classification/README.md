
#### In this project, I have used what I've learned about deep neural networks and convolutional neural networks to classify german traffic signs using the TensorFlow framework.  This project is submitted as partial fulfillment of Udacity's Self-Driving Car Engineer Nanodegree program.

*Jupyter Notebook*
- Traffic_Sign_Classifier.ipynb

*Generated HTML*
- report.html

*PDF Writeup Ver2*
- WRITEUP_ver2.pdf

#### DATA
- [.p files](https://www.dropbox.com/s/jupqa5nwey4bvgm/traffic-signs-data.zip?dl=0)

----

### Recommendations for Improvements

- To strengthen the predictions of this convolutional neural network, I think we should feed it more data. Some of the classes were represented far more than others. The lack of balance in the training data set results in a bias towards classes with more data points. We can generate "fake" data points for less represented classes by applying small but random translational and rotational shifts as well as shearing and warping to existing images in the training set. 

- Preprocessing the data can be made faster by using better localized histogram equalization techniques and also no longer normalizing the values to be floats within the range of 0 to 1. Using integers between 0, 255 might be sufficient.

- Visualizing the network weights can also help in designing the architecture. Visualize them by plotting the weights filters of the convolutional layers as grayscale images.

- Check the data points which are incorrectly predicted by the system and try to analyze this information.

- Experiment with hyperparameters and other architectures.Try fiddling with the filter size of the convolutional layers as well like its output/output depth, you can also fiddle with the output size of the fully connected layers and the dropout probability.

- Use L2 regulation or early stopping techniques to prevent overfitting. 

- Play around with different types of optimizer functions.

----

### Miscellaneous

This convolutional neural network is a modified version of this code as presented in the lectures:
- https://github.com/aymericdamien/TensorFlow-Examples/blob/master/examples/3_NeuralNetworks/convolutional_network.py

Data sets used is publicly available here:
- http://benchmark.ini.rub.de/?section=gtsrb&subsection=dataset 
- https://d17h27t6h515a5.cloudfront.et/topher/2016/November/581faac4_traffic-signs-data/traffic-signs-data.zip

----

### Good Readings

- http://cs231n.github.io/
- http://www.deeplearningbook.org/
- http://neuralnetworksanddeeplearning.com/
- http://www.holehouse.org/mlclass/09_Neural_Networks_Learning.html
- http://danielnouri.org/notes/2014/12/17/using-convolutional-neural-nets-to-detect-facial-keypoints-tutorial/
- https://github.com/hengck23-udacity/udacity-driverless-car-nd-p2
- http://navoshta.com/traffic-signs-classification/




