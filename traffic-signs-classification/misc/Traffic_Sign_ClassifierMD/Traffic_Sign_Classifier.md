

```python
import csv
import random
import numpy as np
import tensorflow as tf
from tensorflow.contrib.layers import flatten
import pickle
import matplotlib.pyplot as plt
%matplotlib inline
from sklearn.utils import shuffle
from scipy.misc import imread, imsave, imresize
from skimage import exposure
import warnings 
```


```python
def preprocess(X):
    '''
    - convert images to grayscale, 
    - scale from [0, 255] to [0, 1] range, 
    - use localized histogram equalization as images differ 
      in brightness and contrast significantly
    ADAPTED FROM: http://navoshta.com/traffic-signs-classification/
    '''

    #Convert to grayscale, e.g. single channel Y
    X = 0.299 * X[:, :, :, 0] + 0.587 * X[:, :, :, 1] + 0.114 * X[:, :, :, 2]

    #Scale features to be in [0, 1]
    X = (X / 255.).astype(np.float32)
    
    #adjust histogram
    for i in range(X.shape[0]):
        with warnings.catch_warnings():
            warnings.simplefilter("ignore")
            X[i] = exposure.equalize_adapthist(X[i]) 
            
    return X

def reshape(x): # Add a single grayscale channel
  return x.reshape(x.shape + (1,))
```


```python
######################################
##   LOAD AND PREPROCESS DATA       #
####################################

#''' 
#The pickled data is a dictionary with 4 key/value pairs
#
#features: the images pixel values, (width, height, channels)
#labels: the label of the traffic sign
#sizes: the original width and height of the image, (width, height)
#coords: coordinates of a bounding box around the sign in the image, 
#        (x1, y1, x2, y2). 
#        Based the original image (not the resized version).
#'''
```


```python
##########################################################
#!!   EDIT ME TO RESPECTIVE FILES PATHS              !! #
########################################################

class_name_file = './signnames.csv'
training_file = "data/train.p"
validation_file = "data/valid.p"
testing_file = "data/test.p"

training_preprocessed_file = "data/X_train_preprocessed.p"
validation_preprocessed_file = "data/X_valid_preprocessed.p"
testing_preprocessed_file = "data/X_test_preprocessed.p" 
```


```python
# LOAD DATA SETS TO MEMORY

with open(training_file, mode='rb') as f:
    train = pickle.load(f)
with open(validation_file, mode='rb') as f:
    valid = pickle.load(f)
with open(testing_file, mode='rb') as f:
    test = pickle.load(f)
    
X_train, y_train = train['features'], train['labels']
X_valid, y_valid = valid['features'], valid['labels']
X_test, y_test = test['features'], test['labels']
```


```python
print("Preprocessing the data to improve feature extraction...")
print("This might take a while...")

X_preprocessed = preprocess(X_train)
X_train_preprocessed = reshape(X_preprocessed)
print("training set preprocessing complete!", X_train_preprocessed.shape)

X_valid_preprocessed = preprocess(X_valid)
X_valid_preprocessed = reshape(X_valid_preprocessed)
print("cross validation set preprocessing complete!", X_valid_preprocessed.shape)

X_test_preprocessed = preprocess(X_test)
X_test_preprocessed = reshape(X_test_preprocessed)
print("test set preprocessing complete!", X_test_preprocessed.shape)
```

    Preprocessing the data to improve feature extraction...
    This might take a while...
    training set preprocessing complete! (34799, 32, 32, 1)
    cross validation set preprocessing complete! (4410, 32, 32, 1)
    test set preprocessing complete! (12630, 32, 32, 1)



```python
# Save the preprocessed data set, so we don't have to preprocess it everytime 

pickle.dump(X_train_preprocessed, open(training_preprocessed_file, "wb" ))
pickle.dump(X_valid_preprocessed, open(validation_preprocessed_file, "wb" ))
pickle.dump(X_test_preprocessed, open(testing_preprocessed_file, "wb" ))
```


```python
# If the preprocessed data exists, we can just open them up
# no need to preprocess them everytime  

with open(training_preprocessed_file, mode='rb') as f:
    X_train_preprocessed = pickle.load(f)
with open(validation_preprocessed_file, mode='rb') as f:
    X_valid_preprocessed = pickle.load(f)
with open(testing_preprocessed_file, mode='rb') as f:
    X_test_preprocessed = pickle.load(f)
```


```python
######################################
#          DATA EXPLORATION         #
####################################
```


```python
# We can see some basic statistics about the data sets here 

n_train = X_train.shape[0]
n_test = X_test.shape[0]
n_classes = len(np.unique(y_test))

number_of_images, image_width, image_height, number_of_color_channels = X_train.shape
image_shape = image_width, image_height, number_of_color_channels

print()
print("X_train :", X_train.shape)
print("y_train :", y_train.shape)
print("X_valid :", X_valid.shape)
print("y_valid :", y_valid.shape)
print("X_test  :", X_test.shape)
print("y_test  :", y_test.shape)

print()
print("Number of training examples =", n_train)
print("Number of testing examples =", n_test)
print("Image data shape =", image_shape)
print("Number of classes =", n_classes)
```

    
    X_train : (34799, 32, 32, 3)
    y_train : (34799,)
    X_valid : (4410, 32, 32, 3)
    y_valid : (4410,)
    X_test  : (12630, 32, 32, 3)
    y_test  : (12630,)
    
    Number of training examples = 34799
    Number of testing examples = 12630
    Image data shape = (32, 32, 3)
    Number of classes = 43



```python
# Let's count how many samples per classification the training set has
# We can also map the label value representation to actual human label from CSV file
# in essence: y: 10 is the STOP sign
# Notice that the data set is not shuffled, images with the same class are adjacent to each
# other in the list. So a running count is useful to to know what range of position 
# an images of the same class occupies. 

classes_lineup = []
count_per_class = [0]*n_classes
running_counts = [0]*n_classes
class_names = []

for i in range(0, len(y_train)):
    if y_train[i] not in classes_lineup:
        classes_lineup.append(y_train[i])
    count_per_class[y_train[i]]+=1

count_before = 0
for n in classes_lineup:
    running_counts[n] = count_per_class[n] + count_before
    count_before = running_counts[n]
    
with open(class_name_file) as _f:
    rows = csv.reader(_f, delimiter=',')
    next(rows, None)
    for i, row in enumerate(rows):
        assert(i==int(row[0]))
        class_names.append(row[1]) 
```


```python
def show_images(X, end, total, images_per_row = 30, images_per_col = 15,
                H = 20, W = 1, its_gray = False):    
    number_of_images = images_per_row * images_per_col
    figure, axis = plt.subplots(images_per_col, images_per_row, figsize=(H, W))
    figure.subplots_adjust(hspace = .2, wspace=.001)
    axis = axis.ravel()
    
    for i in range(number_of_images):
        index = random.randint(end - total, end - 1)
        image = X[index]
        axis[i].axis('off')
        if its_gray:
          axis[i].imshow(image.reshape(32,32), cmap='gray')
        else:
          axis[i].imshow(image)
```


```python
def plot_histogram(data, name):
  class_list = range(n_classes)
  label_list = data.tolist()
  counts = [label_list.count(i) for i in class_list]
  plt.bar(class_list, counts)
  plt.xlabel(name)
  plt.show()
```


```python
# More useful statistics about the data set
# value representation of that class/label 
# number of images with that class/label
# running count, and name of the class/label

print("-----------------------------------------------------------")
print("|%-*s | RUNNING | #   | NAME'" % (6, 'COUNT'))
print("-----------------------------------------------------------")

for n in classes_lineup:
    print("|%-*s | %-*s | %-*s | %s " % (6, count_per_class[n], 7, running_counts[n], 3, n, class_names[n]))
```

    -----------------------------------------------------------
    |COUNT  | RUNNING | #   | NAME'
    -----------------------------------------------------------
    |210    | 210     | 41  | End of no passing 
    |690    | 900     | 31  | Wild animals crossing 
    |330    | 1230    | 36  | Go straight or right 
    |540    | 1770    | 26  | Traffic signals 
    |450    | 2220    | 23  | Slippery road 
    |1980   | 4200    | 1   | Speed limit (30km/h) 
    |300    | 4500    | 40  | Roundabout mandatory 
    |330    | 4830    | 22  | Bumpy road 
    |180    | 5010    | 37  | Go straight or left 
    |360    | 5370    | 16  | Vehicles over 3.5 metric tons prohibited 
    |1260   | 6630    | 3   | Speed limit (60km/h) 
    |180    | 6810    | 19  | Dangerous curve to the left 
    |1770   | 8580    | 4   | Speed limit (70km/h) 
    |1170   | 9750    | 11  | Right-of-way at the next intersection 
    |210    | 9960    | 42  | End of no passing by vehicles over 3.5 metric tons 
    |180    | 10140   | 0   | Speed limit (20km/h) 
    |210    | 10350   | 32  | End of all speed and passing limits 
    |210    | 10560   | 27  | Pedestrians 
    |240    | 10800   | 29  | Bicycles crossing 
    |240    | 11040   | 24  | Road narrows on the right 
    |1320   | 12360   | 9   | No passing 
    |1650   | 14010   | 5   | Speed limit (80km/h) 
    |1860   | 15870   | 38  | Keep right 
    |1260   | 17130   | 8   | Speed limit (120km/h) 
    |1800   | 18930   | 10  | No passing for vehicles over 3.5 metric tons 
    |1080   | 20010   | 35  | Ahead only 
    |360    | 20370   | 34  | Turn left ahead 
    |1080   | 21450   | 18  | General caution 
    |360    | 21810   | 6   | End of speed limit (80km/h) 
    |1920   | 23730   | 13  | Yield 
    |1290   | 25020   | 7   | Speed limit (100km/h) 
    |390    | 25410   | 30  | Beware of ice/snow 
    |270    | 25680   | 39  | Keep left 
    |270    | 25950   | 21  | Double curve 
    |300    | 26250   | 20  | Dangerous curve to the right 
    |599    | 26849   | 33  | Turn right ahead 
    |480    | 27329   | 28  | Children crossing 
    |1890   | 29219   | 12  | Priority road 
    |690    | 29909   | 14  | Stop 
    |540    | 30449   | 15  | No vehicles 
    |990    | 31439   | 17  | No entry 
    |2010   | 33449   | 2   | Speed limit (50km/h) 
    |1350   | 34799   | 25  | Road work 



```python
#PLOT 350 RANDOM IMAGES from training set
show_images(X_train, len(X_train), len(X_train), 
            images_per_row = 30, images_per_col = 15, 
            H = 20, W = 10)
```


![png](output_14_0.png)



```python
#PLOT 350 RANDOM IMAGES from PREPROCESSED training set
i = np.copy(X_train_preprocessed)

show_images(i, len(i), len(i), images_per_row = 30, images_per_col = 15, 
            H = 20, W = 10, its_gray = True)
```


![png](output_15_0.png)



```python
#PLOT 10 RANDOM IMAGES each per classification
for n in classes_lineup:
    show_images(X_train, running_counts[n], count_per_class[n], 
                images_per_row = 10, images_per_col = 1, H = 10, W = 10)
```

    /home/carnd/anaconda3/envs/carnd-term1/lib/python3.5/site-packages/matplotlib/pyplot.py:524: RuntimeWarning: More than 20 figures have been opened. Figures created through the pyplot interface (`matplotlib.pyplot.figure`) are retained until explicitly closed and may consume too much memory. (To control this warning, see the rcParam `figure.max_open_warning`).
      max_open_warning, RuntimeWarning)



![png](output_16_1.png)



![png](output_16_2.png)



![png](output_16_3.png)



![png](output_16_4.png)



![png](output_16_5.png)



![png](output_16_6.png)



![png](output_16_7.png)



![png](output_16_8.png)



![png](output_16_9.png)



![png](output_16_10.png)



![png](output_16_11.png)



![png](output_16_12.png)



![png](output_16_13.png)



![png](output_16_14.png)



![png](output_16_15.png)



![png](output_16_16.png)



![png](output_16_17.png)



![png](output_16_18.png)



![png](output_16_19.png)



![png](output_16_20.png)



![png](output_16_21.png)



![png](output_16_22.png)



![png](output_16_23.png)



![png](output_16_24.png)



![png](output_16_25.png)



![png](output_16_26.png)



![png](output_16_27.png)



![png](output_16_28.png)



![png](output_16_29.png)



![png](output_16_30.png)



![png](output_16_31.png)



![png](output_16_32.png)



![png](output_16_33.png)



![png](output_16_34.png)



![png](output_16_35.png)



![png](output_16_36.png)



![png](output_16_37.png)



![png](output_16_38.png)



![png](output_16_39.png)



![png](output_16_40.png)



![png](output_16_41.png)



![png](output_16_42.png)



![png](output_16_43.png)



```python
#PLOT HISTOGRAM OF EACH DATA SET
plot_histogram(y_train, name = "TRAINING SET: number of data points per class")
plot_histogram(y_valid, name = "CROSS VALIDATION SET: number of data points per class")
plot_histogram(y_test, name = "TEST SET: number of data points per class")
```


![png](output_17_0.png)



![png](output_17_1.png)



![png](output_17_2.png)



```python
######################################
#      NETWORK ARCHITECTURE         #
####################################
```


```python
def convolution(x, W, b, s = 1, with_relu = True, with_maxpool = False):
    result = tf.nn.conv2d(x, W, strides = [1, s, s, 1], padding = 'SAME')
    result = tf.nn.bias_add( result, b)
    if with_relu:
        result = tf.nn.relu(result)
    if with_maxpool:
        result = tf.nn.max_pool( result, ksize = [1, 2, 2, 1], strides = [1, 2, 2, 1], padding = 'SAME')
    return result

def fully_connected(x, W, b, keep_prob, do_flatten = True, with_relu = True):
    if do_flatten:
        x = flatten(x)
    result = tf.add(tf.matmul(x, W), b) 
    if with_relu:
        result = tf.nn.relu(result)
    result = tf.nn.dropout(result, keep_prob)
    return result
    
def network(x, W, b, dropout_prob):
    r = convolution(x, W['wc1'], b['bc1'], with_maxpool = True)
    r = convolution(r, W['wc2'], b['bc2'], with_maxpool = True)
    r = fully_connected(r, W['wf1'], b['bf1'], keep_prob = dropout_prob)
    r = fully_connected(r, W['wf2'], b['bf2'], keep_prob = dropout_prob, do_flatten = False, with_relu = False)
    return r 
```


```python
output_size = 43 #number of classifiers/labels - n_classes
c = 1         
fs1 = 5       
fs2 = 5        
depth1 = 64  #32
depth2 = 32  #64
fc_out = 256 #1024


weights = {
    'wc1': tf.Variable(tf.truncated_normal(shape=(fs1, fs1, c, depth1), mean = 0, stddev = 0.1)),
    'wc2': tf.Variable(tf.truncated_normal(shape=(fs2, fs2, depth1, depth2), mean = 0, stddev = 0.1)),
    'wf1': tf.Variable(tf.truncated_normal(shape=(8*8*depth2, fc_out), mean = 0, stddev = 0.1)),
    'wf2': tf.Variable(tf.truncated_normal(shape=(fc_out, output_size), mean = 0, stddev = 0.1))  
}

biases = {
    'bc1': tf.Variable(tf.zeros(depth1)),
    'bc2': tf.Variable(tf.zeros(depth2)),
    'bf1': tf.Variable(tf.zeros(fc_out)),
    'bf2': tf.Variable(tf.zeros(output_size))
}

#CONV1_INPUT: 32x32x1 OUTPUT:32x32xdepth1 MAXPOOLOUTPUT: 16x16xdepth1
#CONV2_INPUT: 16x16xdepth1 OUTPUT: 16x16xdepth2 MAXPOOLOUTPUT: 8x8xdepth2
#FC1_INPUT: 8x8xdepth2 OUTPUT: 8x8xdepth2
#FC1_INPUT: 8x8xdepth2 OUTPUT: n_classes
```


```python
################################################
#      NETWORK TRAINING     AND TESTING       #
##############################################
```


```python
LEARNING_RATE = 0.00005

EPOCHS = 180     
BATCH_SIZE = 256 #512

IMAGE_SIZE = 32
NUMBER_OF_CLASSES = 43           #n_classes
NUMBER_OF_TRAINING_DATA = 34799  #len(y_train)

LR = tf.placeholder(tf.float32)
x = tf.placeholder(tf.float32, shape = (None, IMAGE_SIZE, IMAGE_SIZE, 1))
y = tf.placeholder(tf.int32, shape = (None))
one_hot_y = tf.one_hot(y, NUMBER_OF_CLASSES)
keep_prob = tf.placeholder(tf.float32) 

saver = tf.train.Saver()

logits = network(x, weights, biases, dropout_prob = keep_prob)

CROSS_ENTROPY_OPERATION = tf.nn.softmax_cross_entropy_with_logits(logits, one_hot_y)
LOSS_OPERATION = tf.reduce_mean(CROSS_ENTROPY_OPERATION)
OPTIMIZER_OPERATION = tf.train.AdamOptimizer(learning_rate = LR)
TRAINING_OPERATION = OPTIMIZER_OPERATION.minimize(LOSS_OPERATION)
INFERENCE_OPERATION = tf.argmax(logits, 1)
CORRECT_PREDICTION_OPERATION = tf.equal(INFERENCE_OPERATION, tf.argmax(one_hot_y, 1))
ACCURACY_OPERATION = tf.reduce_mean(tf.cast(CORRECT_PREDICTION_OPERATION, tf.float32))
```


```python
def get_batch(X_data, y_data, start, BATCH_SIZE):
    end = start + BATCH_SIZE
    return X_data[start:end], y_data[start:end]

def evaluate(X_data, y_data):
    
    total_accuracy = 0
    total_samples = len(X_data)
    sess = tf.get_default_session()
    
    for start in range(0, total_samples, BATCH_SIZE):        
        batch_x, batch_y = get_batch(X_data, y_data, start, BATCH_SIZE) 
        params = {x: batch_x, y: batch_y, keep_prob: 1.0}
        accuracy = sess.run(ACCURACY_OPERATION, feed_dict= params)
        total_accuracy += (accuracy * len(batch_x))
    
    return total_accuracy / total_samples
```


```python
# TRAIN THE MODEL

with tf.Session() as sess:
    
    sess.run(tf.global_variables_initializer())

    for epoch in range(EPOCHS):
        
        X_data, y_data = shuffle(X_train_preprocessed, y_train)
        
        for start in range(0, NUMBER_OF_TRAINING_DATA, BATCH_SIZE):
            
            batch_x, batch_y = get_batch(X_data, y_data, start, BATCH_SIZE)
            params = {x: batch_x, y: batch_y, keep_prob: 0.75, LR: LEARNING_RATE}
            _, loss = sess.run([TRAINING_OPERATION, LOSS_OPERATION], feed_dict = params)
            
        validation_accuracy = evaluate(X_valid_preprocessed, y_valid)
        
        print("{:3d}".format(epoch), "VA = {:.3f}".format(validation_accuracy), 
              "cost est= {:.3f}".format(loss))
        
    saver.save(sess, './model')
    print("Model saved")
```

      0 VA = 0.178 cost est= 3.447
      1 VA = 0.355 cost est= 2.949
      2 VA = 0.485 cost est= 2.474
      3 VA = 0.565 cost est= 2.163
      4 VA = 0.609 cost est= 2.062
      5 VA = 0.659 cost est= 1.714
      6 VA = 0.697 cost est= 1.744
      7 VA = 0.732 cost est= 1.512
      8 VA = 0.750 cost est= 1.469
      9 VA = 0.769 cost est= 1.470
     10 VA = 0.784 cost est= 1.390
     11 VA = 0.795 cost est= 1.458
     12 VA = 0.807 cost est= 1.366
     13 VA = 0.814 cost est= 1.441
     14 VA = 0.823 cost est= 1.187
     15 VA = 0.830 cost est= 1.189
     16 VA = 0.844 cost est= 1.082
     17 VA = 0.844 cost est= 1.181
     18 VA = 0.852 cost est= 1.224
     19 VA = 0.861 cost est= 1.155
     20 VA = 0.860 cost est= 1.007
     21 VA = 0.866 cost est= 1.043
     22 VA = 0.872 cost est= 0.921
     23 VA = 0.874 cost est= 0.971
     24 VA = 0.878 cost est= 0.939
     25 VA = 0.881 cost est= 0.819
     26 VA = 0.885 cost est= 0.917
     27 VA = 0.890 cost est= 0.988
     28 VA = 0.884 cost est= 0.927
     29 VA = 0.891 cost est= 0.892
     30 VA = 0.891 cost est= 0.920
     31 VA = 0.899 cost est= 0.985
     32 VA = 0.896 cost est= 0.847
     33 VA = 0.902 cost est= 0.859
     34 VA = 0.900 cost est= 0.798
     35 VA = 0.901 cost est= 0.929
     36 VA = 0.905 cost est= 0.734
     37 VA = 0.904 cost est= 0.764
     38 VA = 0.908 cost est= 0.930
     39 VA = 0.907 cost est= 0.708
     40 VA = 0.910 cost est= 0.982
     41 VA = 0.913 cost est= 0.829
     42 VA = 0.912 cost est= 0.688
     43 VA = 0.912 cost est= 0.785
     44 VA = 0.917 cost est= 0.740
     45 VA = 0.913 cost est= 0.861
     46 VA = 0.917 cost est= 0.745
     47 VA = 0.920 cost est= 0.940
     48 VA = 0.922 cost est= 0.622
     49 VA = 0.920 cost est= 0.812
     50 VA = 0.917 cost est= 0.730
     51 VA = 0.921 cost est= 0.678
     52 VA = 0.921 cost est= 0.741
     53 VA = 0.919 cost est= 0.775
     54 VA = 0.924 cost est= 0.701
     55 VA = 0.924 cost est= 0.901
     56 VA = 0.925 cost est= 0.870
     57 VA = 0.924 cost est= 0.768
     58 VA = 0.925 cost est= 0.754
     59 VA = 0.927 cost est= 0.776
     60 VA = 0.923 cost est= 0.751
     61 VA = 0.924 cost est= 0.737
     62 VA = 0.927 cost est= 0.660
     63 VA = 0.929 cost est= 0.713
     64 VA = 0.928 cost est= 0.728
     65 VA = 0.926 cost est= 0.762
     66 VA = 0.930 cost est= 0.738
     67 VA = 0.929 cost est= 0.793
     68 VA = 0.927 cost est= 0.664
     69 VA = 0.931 cost est= 0.758
     70 VA = 0.929 cost est= 0.742
     71 VA = 0.933 cost est= 0.532
     72 VA = 0.933 cost est= 0.613
     73 VA = 0.934 cost est= 0.743
     74 VA = 0.934 cost est= 0.618
     75 VA = 0.930 cost est= 0.698
     76 VA = 0.935 cost est= 0.658
     77 VA = 0.932 cost est= 0.798
     78 VA = 0.932 cost est= 0.692
     79 VA = 0.934 cost est= 0.638
     80 VA = 0.938 cost est= 0.569
     81 VA = 0.934 cost est= 0.688
     82 VA = 0.939 cost est= 0.597
     83 VA = 0.939 cost est= 0.676
     84 VA = 0.936 cost est= 0.729
     85 VA = 0.938 cost est= 0.721
     86 VA = 0.935 cost est= 0.611
     87 VA = 0.934 cost est= 0.626
     88 VA = 0.941 cost est= 0.661
     89 VA = 0.938 cost est= 0.646
     90 VA = 0.935 cost est= 0.719
     91 VA = 0.942 cost est= 0.745
     92 VA = 0.937 cost est= 0.785
     93 VA = 0.937 cost est= 0.726
     94 VA = 0.940 cost est= 0.701
     95 VA = 0.940 cost est= 0.620
     96 VA = 0.936 cost est= 0.674
     97 VA = 0.941 cost est= 0.598
     98 VA = 0.941 cost est= 0.541
     99 VA = 0.943 cost est= 0.749
    100 VA = 0.941 cost est= 0.626
    101 VA = 0.940 cost est= 0.713
    102 VA = 0.941 cost est= 0.581
    103 VA = 0.946 cost est= 0.661
    104 VA = 0.940 cost est= 0.597
    105 VA = 0.941 cost est= 0.673
    106 VA = 0.945 cost est= 0.582
    107 VA = 0.943 cost est= 0.562
    108 VA = 0.945 cost est= 0.504
    109 VA = 0.945 cost est= 0.700
    110 VA = 0.946 cost est= 0.682
    111 VA = 0.947 cost est= 0.765
    112 VA = 0.946 cost est= 0.475
    113 VA = 0.944 cost est= 0.583
    114 VA = 0.942 cost est= 0.576
    115 VA = 0.945 cost est= 0.626
    116 VA = 0.947 cost est= 0.558
    117 VA = 0.948 cost est= 0.616
    118 VA = 0.945 cost est= 0.718
    119 VA = 0.946 cost est= 0.574
    120 VA = 0.946 cost est= 0.636
    121 VA = 0.947 cost est= 0.699
    122 VA = 0.947 cost est= 0.698
    123 VA = 0.946 cost est= 0.843
    124 VA = 0.949 cost est= 0.638
    125 VA = 0.945 cost est= 0.566
    126 VA = 0.947 cost est= 0.528
    127 VA = 0.948 cost est= 0.601
    128 VA = 0.949 cost est= 0.782
    129 VA = 0.946 cost est= 0.591
    130 VA = 0.948 cost est= 0.624
    131 VA = 0.946 cost est= 0.706
    132 VA = 0.949 cost est= 0.574
    133 VA = 0.948 cost est= 0.583
    134 VA = 0.947 cost est= 0.709
    135 VA = 0.947 cost est= 0.597
    136 VA = 0.949 cost est= 0.589
    137 VA = 0.948 cost est= 0.734
    138 VA = 0.949 cost est= 0.660
    139 VA = 0.948 cost est= 0.503
    140 VA = 0.947 cost est= 0.742
    141 VA = 0.950 cost est= 0.668
    142 VA = 0.946 cost est= 0.597
    143 VA = 0.950 cost est= 0.715
    144 VA = 0.951 cost est= 0.582
    145 VA = 0.949 cost est= 0.579
    146 VA = 0.951 cost est= 0.607
    147 VA = 0.951 cost est= 0.573
    148 VA = 0.951 cost est= 0.609
    149 VA = 0.948 cost est= 0.637
    150 VA = 0.950 cost est= 0.562
    151 VA = 0.953 cost est= 0.588
    152 VA = 0.952 cost est= 0.620
    153 VA = 0.949 cost est= 0.642
    154 VA = 0.949 cost est= 0.659
    155 VA = 0.949 cost est= 0.682
    156 VA = 0.950 cost est= 0.666
    157 VA = 0.949 cost est= 0.648
    158 VA = 0.951 cost est= 0.616
    159 VA = 0.954 cost est= 0.546
    160 VA = 0.951 cost est= 0.645
    161 VA = 0.951 cost est= 0.535
    162 VA = 0.952 cost est= 0.668
    163 VA = 0.952 cost est= 0.597
    164 VA = 0.953 cost est= 0.605
    165 VA = 0.952 cost est= 0.585
    166 VA = 0.952 cost est= 0.719
    167 VA = 0.954 cost est= 0.706
    168 VA = 0.951 cost est= 0.633
    169 VA = 0.951 cost est= 0.677
    170 VA = 0.952 cost est= 0.571
    171 VA = 0.951 cost est= 0.578
    172 VA = 0.950 cost est= 0.568
    173 VA = 0.954 cost est= 0.594
    174 VA = 0.953 cost est= 0.676
    175 VA = 0.950 cost est= 0.511
    176 VA = 0.957 cost est= 0.621
    177 VA = 0.953 cost est= 0.675
    178 VA = 0.956 cost est= 0.652
    179 VA = 0.955 cost est= 0.630
    Model saved



```python
# EVALUATE USING TEST DATA 

with tf.Session() as sess:
    saver.restore(sess, tf.train.latest_checkpoint('.'))
    test_accuracy = evaluate(X_test_preprocessed, y_test)
    print("Test Accuracy = {:.3f}".format(test_accuracy))
```

    Test Accuracy = 0.946



```python
###################################
#   Test the model on New Images #
#################################
```


```python
# LOAD THE NEW IMAGES FROM THE INTERNET TO A NUMPY ARRAY

path = 'data/'
image_name = ['0-20speed','1-30speed',
              '12-priority-road','13-yield',
              '14-stop','17-no-entry',
              '18-general-caution','3-60speed',
              '36-go-straight-right', 
              '40-roundabout-mandatory']

image_list = []

for name in image_name:
    img = imread(path + name + '.png')
    img = imresize(img, (32, 32))
    image_list.append(img)

own_set_x = np.array(image_list)
own_set_x = preprocess(own_set_x)
own_set_x = reshape(own_set_x)
own_set_y = np.array([0, 1, 12, 13, 14, 17, 18, 3, 36, 40])
print(own_set_x.shape, own_set_y.shape)
```

    (10, 32, 32, 1) (10,)



```python
#show selected image from internet 

number_of_images = len(image_list)
figure, axis = plt.subplots(1, number_of_images, figsize=(20, 20))
figure.subplots_adjust(hspace = .2, wspace=.001)
axis = axis.ravel()
    
for i in range(number_of_images):     
    image = image_list[i]
    axis[i].axis('off')
    axis[i].imshow(image)
```


![png](output_28_0.png)



```python
#CHECK HOW OUR SELECTED IMAGES FAIRED, AND ITS TOP 5 PREDICTION BASED on built-in top_k function 

with tf.Session() as sess:
    saver.restore(sess, tf.train.latest_checkpoint('.'))
    OUT = sess.run(tf.argmax(logits, 1), feed_dict={x: own_set_x, y: own_set_y, keep_prob: 1.0})
    print("", OUT, "<-predictions")
    print("", own_set_y, "<-actual")

with tf.Session() as sess:
    saver.restore(sess, tf.train.latest_checkpoint('.'))
    OUT = sess.run(tf.nn.top_k(tf.nn.softmax(logits), 5), feed_dict={x: own_set_x, y: own_set_y, keep_prob: 1.0})
    print(OUT[1].T)
    print("(top  5 predictions above) for each image")
    
print()    
print("probability for top 5 predictions for each image:")
for i in range(len(own_set_y)):
    print(i, OUT[0][i].T)


with tf.Session() as sess:
    saver.restore(sess, tf.train.latest_checkpoint('.'))
    test_accuracy = evaluate(own_set_x, own_set_y )
    print("Test Accuracy = {:.3f}".format(test_accuracy))
```

     [ 0  1 12 13 14 17 18  3 36 40] <-predictions
     [ 0  1 12 13 14 17 18  3 36 40] <-actual
    [[ 0  1 12 13 14 17 18  3 36 40]
     [ 1  0 41 12  5  9 26 28 13 37]
     [32  2 35 35  1 13  4 40 28 12]
     [35  5 15 15 40 35 11 35 35 11]
     [ 6  7 40  5 33 32 24 11 12  7]]
    (top  5 predictions above) for each image
    
    probability for top 5 predictions for each image:
    0 [  9.81733441e-01   1.79047305e-02   1.56996073e-04   8.96898564e-05
       8.69674623e-05]
    1 [  9.99999881e-01   8.71776535e-08   3.14505613e-08   1.04039453e-08
       3.02087932e-09]
    2 [  1.00000000e+00   1.31352940e-09   1.00492659e-09   6.52618570e-10
       4.45015802e-10]
    3 [  9.99999881e-01   1.35349822e-07   5.87961971e-11   3.51375491e-11
       3.08744592e-11]
    4 [  9.99447763e-01   3.10564443e-04   1.51801534e-04   3.46596680e-05
       1.87184160e-05]
    5 [  1.00000000e+00   1.87969557e-10   6.72472078e-11   2.32838523e-11
       5.54580036e-12]
    6 [  1.00000000e+00   2.92547107e-08   2.58097432e-09   1.73857773e-09
       1.08491138e-09]
    7 [  9.96503234e-01   7.56855297e-04   5.36789594e-04   4.64317447e-04
       4.07741842e-04]
    8 [ 0.71430153  0.17930424  0.04936121  0.04407945  0.00309171]
    9 [  1.00000000e+00   1.05749176e-09   8.63611738e-10   2.26828875e-10
       1.02200789e-10]
    Test Accuracy = 1.000



```python

```
