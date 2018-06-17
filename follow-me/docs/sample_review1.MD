# WRITEUP

- :tada: You explained the objective of this project well.
- :tada:  You described the network architecture you used
- :tada: You provided a discussion about specific hyperparameters
- :tada: You discussed your training runs and how you tweaked your parameters based on the  results of each run
- :tada: You used plots and graphs to illustrate help with your discussions
- :tada: You discussed potential improvements that could be done to increase the accuracy and/or efficiency of the model

### :exclamation: :boom: :rotating_light: IMPORTANT

As per Udacity's guideline in order to meet specifications, I quote:

> If a student does not include a "Future Enhancements"; this implies they have not done his/her due diligence with understanding the project and the problem domain.
> A discussion on potential improvements to the project submission should also be included for future enhancements to the network / parameters that could be used to increase accuracy, efficiency, etc.
> It is not required to make such enhancements, but these enhancements should be explicitly stated in its own section titled "Future Enhancements"

:fire: :fire: :fire: Your writeup does not include an explicit **"Future Enhancements"** section. I saw that a paragraph which provides this requirement well. Other reviewers might not be too lenient with this, next time you  might want to recheck the rubric before submitting your project. Thanks!

:thumbsup: Here's the quotation from your writeup:
> In order to further improve the training model, more data could be added to the training set. Another way could be to further tweak the hyper parameters. The hyper parameters for steps per epoch (training and validation) and workers were not adjusted for training this network. Optimization of the hyper parameters could yield better performance. The FCN model could also be changed to include more encoder and decoder layers with higher filter dimensions. This would increase training computation cost, but coupled with more training data could see appreciable gains in network performance.

### Other things you can do to improve your network
One student said in Slack that having a deeper network with more layers would enable learning smaller details which might improve identifying the target from a far away (a far target would mean that it is just a few pixels in size that even a human person would have trouble identifying correctly). Another student suggested that having two sets of encoder/decoder set would have a better chance of being correct as he read in some papers. It would be nice to check these theories. It is also said that the initial values of the weights play a significant role in the direction of learning. Perhaps we can also play with different initializer techniques.

More importantly I guess it that, it is also widely-known that the training data is almost always a larger factor that the architecture used (I learned this from Andrew Ng’s Machine Learning Class). What I think would improve this is to get more data from the simulator with the target person in it, especially pictures where the target person is far away. Also, it is always better have a more balanced data set where the target person is there (maybe have at least 50% of the data).  We can also do more image augmentation techniques to increase the data set as discussed in the links below.

:link: SOURCE
- https://medium.com/towards-data-science/image-augmentation-for-deep-learning-histogram-equalization-a71387f609b2
- https://blog.keras.io/building-powerful-image-classification-models-using-very-little-data.html


# NETWORK ARCHITECTURE

- :tada: You provided a figure of your network architecture as a block diagram
- :tada: You clearly explained the main parts of a fully-convolutional network which are following:
  - decoder
  -  encoder
  - 1x1 convolution
  - skip connections.
 - : tada: You also explained:
   -  batch normalization
   -  bilinear - upsampling
   -  softmax activation

###  :thumbsup: As you have said:
>  Bilinear up-sampling works by linearly interpolating the pixel intensity value from the smaller image pixels to the larger layer.

> Batch normalization is used between each convolution in the network in order to allow for higher learning rates. The basic idea is to treat each convolution in the network as its own neural network. By normalizing the input to each layer, the network is able to train faster.

> The final output layer of the network is a softmax activation function which outputs the probability value for each pixel classification. This is used for determining which pixels belong to the target.

#### :link: If you are interested, you can learn more about FCN, transpose convolution, and semantic segmentation in general in the following links:
- https://www.youtube.com/watch?v=ByjaPdWXKJ4&t=1027s
- https://people.eecs.berkeley.edu/~jonlong/long_shelhamer_fcn.pdf
- http://cv-tricks.com/image-segmentation/transpose-convolution-in-tensorflow/
- https://arxiv.org/pdf/1603.07285.pdf
- http://blog.qure.ai/notes/semantic-segmentation-deep-learning-review
- http://deeplearning.net/software/theano/tutorial/conv_arithmetic.html#transposed-convolution-arithmetic
- https://github.com/vdumoulin/conv_arithmetic


# HYPERPARAMETERS

:tada: You have explained the following:
- Epoch
- Learning Rate
- Batch Size
- Steps per epoch
- Workers

### :pushpin: Epoch
An epoch is one complete pass of all the data in our data set. So 30 epochs means we pass the dataset 30 times. We must be aware of this since a large epoch size might overfit our network while a smaller size will underfit it. Overfit means that it might work very well at our training data set but won’t generalize to new data, while underfit means that   the   model   works   poorly   both   with   our   training   data   and   new   data.

### :pushpin: Learning Rate
The intuition behind learning rate is how quickly a network abandons old beliefs for new ones. We want to find a learning rate that is low enough that the network quickly becomes useful, but high enough that you don't have to spend years training it. If the learning rate is too high then it becomes like a wishy-washy person who always misses the point every time you explain things differently or provide a new example of an idea. If the learning rate is too low then it's like a stupid person who can eventually understand something but takes so long it's annoying. We want the network to have a   learning   rate   (or   sometimes   an   adaptive   learning   rate)   such   that   it   behaves   like   a   reasonably   intelligent   person.

### :pushpin: Batch Size
Computing the gradient over the entire dataset is expensive and slow. This is why we use batches.

It is said that:
1. This is usually 32- 512 data points.
2. In terms of computational power, while the single-sample stochastic GD process takes many many more iterations, you end up getting there for less cost than the full batch mode, "typically."
3. Optimizing the exact size of the mini-batch you should use is generally left to trial and error.
4. It has been observed in practice that when using a larger batch there is a significant degradation in the quality of the model, as measured by its ability to generalize. The lack of generalization ability is due to the fact that large-batch methods tend to converge to sharp minimizers of the training function.
5. Batch size and learning rate are said to be linked. If the batch size is too small then the gradients will become more unstable and would need to reduce the learning rate.

:link: SOURCE https://stats.stackexchange.com/questions/164876/tradeoff-batch-size-vs-number-of-iterations-to-train-a-neural-network/236393


### :pushpin: Steps per epoch:  
The number of steps (batches of samples) before declaring your epoch finished.  This should be the number of training images over batch size because you should theoretically train your entire data on very epoch. Similarly, validation Steps per epoch should be number of validation images over batch size because you should test all your data on every epoch.

:link: SOURCE
- https://keras.io/models/sequential/#fit_generator
- https://stackoverflow.com/questions/45943675/meaning-of-validation-steps-in-keras-sequential-fit-generator-parameter-list

### :pushpin: Workers
This is the number of parallel processes during training. This can affect your training speed and is dependent on your hardware.



# 1x1 convolutional layer vs fully connected layer

:confetti_ball: You seem  have a clear understanding of 1 by 1 convolutions and where/when/how it should be used.
:confetti_ball:  You seem to also demonstrate a clear understanding of a fully connected layer and where/when/how it should be used.

I quote:
> In a fully connected layer each neuron is connected to every neuron in the previous layer, and each connection has it's own weight. This is a totally general purpose connection pattern and makes no assumptions about the features in the data. It's also very expensive in terms of memory (weights) and computation (connections).

:link: SOURCE https://www.reddit.com/r/MachineLearning/comments/3yy7ko/what_is_the_difference_between_a_fullyconnected/

### :pushpin: In this case: we use a 1x1 convolutional layer instead of a fully-connected layer to retain the spatial information.
:link:  Here are related articles about 1x1 convolutions if you're interested:
- http://iamaaditya.github.io/2016/03/one-by-one-convolution/
- https://datascience.stackexchange.com/questions/12830/how-are-1x1-convolutions-the-same-as-a-fully-connected-layer
- https://www.quora.com/What-does-a-1x1-convolutional-layer-do
- https://stats.stackexchange.com/questions/194142/what-does-1x1-convolution-mean-in-a-neural-network


# Decoders and ENcoders

:trophy: :trophy: You have identified the use of various reasons for encoding / decoding images, when it should be used, why it is useful, and any problems that may arise.

:pushpin:  We encode images for the network to essentially learn details about the image for classification. This encoder parts have pooling which down-samples the image. This is used so that the model will generalize to images it hasn’t seen before and reduce the risk of overfitting. The downside of this is that it loses information and reduces the spatial dimension.

:pushpin: The role of the decoder is to recover this spatial dimension. The decoder part maps the low resolution encoder feature maps to full input resolution feature maps for pixel-wise classification.

:pushpin: The encoder layers look like layers from a usual classification neural networks with a final fully-connected layer with pooling techniques to reduce the risk of overfitting. Pooling makes each layer lose information.  It is found that adding connections from encoder layer to the decoder layer called skip connections to add more information makes the results less course.

:pushpin: To connect the the encoder layers to the decoder, instead of a fully connected layer, we use a 1x1 convolutional layer to retain the spatial information.


# This model will not work with a dog

:tada: :tada: You have clearly articulated whether this model and data would work well for following another object (dog, cat, car, etc.) instead of a human and if not, what changes would be required.

As you said:
> The model for the fully convolutional network could be used to identify a different object such as a dog, cat, or car. In order to successfully identify a different target other than the “hero”, the network would need to be retrained with a new dataset containing the desired target. Therefore, this specific project is only relatable to finding the hero in a red shirt, but with a new dataset could be used to find a new target.

Given the current data is set to follow a person, the data would not work well for following a different object like a car because the system is not trained to do so. The developer would need information on this type of object to train and test to follow a new object.


# :heavy_check_mark: The file is in the correct format (.h5) and runs without errors.

# :heavy_check_mark:  The neural network should obtain an accuracy greater than or equal to 40% (0.40) using the Intersection over Union (IoU) metric.


# OPTIONAL REMARKS
:tada: :confetti_ball: :trophy: :rocket: You successfully met all the specifications required to pass this submission. Well-done.

:link: You might also enjoy [this collection of mostly free places online where you can learn more about robotics in general](http://github.com/mithi/robotics-coursework).

:link:  And this [collection of free places where you can practice your deep-learning and AI skills](https://github.com/mithi/ai-playground).

🚗 🚕 🚖 🚛 🚌 🚍 A lot of success to you on your journey into robotics!

:heart: I hope this review meets your expectations and that you have a nice day today!

--> [Mithi](https://medium.com/@mithi)
