import tensorflow as tf
import os.path
import warnings
from distutils.version import LooseVersion
import glob

import helper
import project_tests as tests

#--------------------------
# USER-SPECIFIED DATA
#--------------------------

# Tune these parameters

NUMBER_OF_CLASSES = 2
IMAGE_SHAPE = (160, 576)

EPOCHS = 20
BATCH_SIZE = 1

LEARNING_RATE = 0.0001
DROPOUT = 0.75

# Specify these directory paths

DATA_DIRECTORY = './data'
RUNS_DIRECTORY = './runs'
TRAINING_DATA_DIRECTORY ='./data/data_road/training'
NUMBER_OF_IMAGES = len(glob.glob('./data/data_road/training/calib/*.*'))
VGG_PATH = './data/vgg'

all_training_losses = [] # Used for plotting to visualize if our training is going well given parameters

#--------------------------
# DEPENDENCY CHECK
#--------------------------

# Check TensorFlow Version
assert LooseVersion(tf.__version__) >= LooseVersion('1.0'), 'Please use TensorFlow version 1.0 or newer.  You are using {}'.format(tf.__version__)
print('TensorFlow Version: {}'.format(tf.__version__))


# Check for a GPU
if not tf.test.gpu_device_name():
  warnings.warn('No GPU found. Please use a GPU to train your neural network.')
else:
  print('Default GPU Device: {}'.format(tf.test.gpu_device_name()))

#--------------------------
# PLACEHOLDER TENSORS
#--------------------------

correct_label = tf.placeholder(tf.float32, [None, IMAGE_SHAPE[0], IMAGE_SHAPE[1], NUMBER_OF_CLASSES])
learning_rate = tf.placeholder(tf.float32)
keep_prob = tf.placeholder(tf.float32)

#--------------------------
# FUNCTIONS
#--------------------------

def load_vgg(sess, vgg_path):
  """
  Load Pretrained VGG Model into TensorFlow.
  sess: TensorFlow Session
  vgg_path: Path to vgg folder, containing "variables/" and "saved_model.pb"
  return: Tuple of Tensors from VGG model (image_input, keep_prob, layer3, layer4, layer7)
  """
  
  # load the model and weights
  model = tf.saved_model.loader.load(sess, ['vgg16'], vgg_path)

  # Get Tensors to be returned from graph
  graph = tf.get_default_graph()
  image_input = graph.get_tensor_by_name('image_input:0')
  keep_prob = graph.get_tensor_by_name('keep_prob:0')
  layer3 = graph.get_tensor_by_name('layer3_out:0')
  layer4 = graph.get_tensor_by_name('layer4_out:0')
  layer7 = graph.get_tensor_by_name('layer7_out:0')

  return image_input, keep_prob, layer3, layer4, layer7


def conv_1x1(layer, layer_name):
  """ Return the output of a 1x1 convolution of a layer """
  return tf.layers.conv2d(inputs = layer,
                          filters =  NUMBER_OF_CLASSES,
                          kernel_size = (1, 1),
                          strides = (1, 1),
                          name = layer_name)


def upsample(layer, k, s, layer_name):
  """ Return the output of transpose convolution given kernel_size k and strides s """
  return tf.layers.conv2d_transpose(inputs = layer,
                                    filters = NUMBER_OF_CLASSES,
                                    kernel_size = (k, k),
                                    strides = (s, s),
                                    padding = 'same',
                                    name = layer_name)


def layers(vgg_layer3_out, vgg_layer4_out, vgg_layer7_out, num_classes = NUMBER_OF_CLASSES):
  """
  Create the layers for a fully convolutional network.  Build skip-layers using the vgg layers.
  vgg_layerX_out: TF Tensor for VGG Layer X output
  num_classes: Number of classes to classify
  return: The Tensor for the last layer of output
  """

  # Use a shorter variable name for simplicity
  layer3, layer4, layer7 = vgg_layer3_out, vgg_layer4_out, vgg_layer7_out

  # Apply a 1x1 convolution to encoder layers
  layer3x = conv_1x1(layer = layer3, layer_name = "layer3conv1x1")
  layer4x = conv_1x1(layer = layer4, layer_name = "layer4conv1x1")
  layer7x = conv_1x1(layer = layer7, layer_name = "layer7conv1x1")
 
  # Add decoder layers to the network with skip connections and upsampling
  # Note: the kernel size and strides are the same as the example in Udacity Lectures
  #       Semantic Segmentation Scene Understanding Lesson 10-9: FCN-8 - Decoder
  decoderlayer1 = upsample(layer = layer7x, k = 4, s = 2, layer_name = "decoderlayer1")
  decoderlayer2 = tf.add(decoderlayer1, layer4x, name = "decoderlayer2")
  decoderlayer3 = upsample(layer = decoderlayer2, k = 4, s = 2, layer_name = "decoderlayer3")
  decoderlayer4 = tf.add(decoderlayer3, layer3x, name = "decoderlayer4")
  decoderlayer_output = upsample(layer = decoderlayer4, k = 16, s = 8, layer_name = "decoderlayer_output")

  return decoderlayer_output


def optimize(nn_last_layer, correct_label, learning_rate, num_classes = NUMBER_OF_CLASSES):
  """
  Build the TensorFLow loss and optimizer operations.
  nn_last_layer: TF Tensor of the last layer in the neural network
  correct_label: TF Placeholder for the correct label image
  learning_rate: TF Placeholder for the learning rate
  num_classes: Number of classes to classify
  return: Tuple of (logits, train_op, cross_entropy_loss)
  """
  # Reshape 4D tensors to 2D, each row represents a pixel, each column a class
  logits = tf.reshape(nn_last_layer, (-1, num_classes))
  class_labels = tf.reshape(correct_label, (-1, num_classes))

  # The cross_entropy_loss is the cost which we are trying to minimize to yield higher accuracy
  cross_entropy = tf.nn.softmax_cross_entropy_with_logits(logits = logits, labels = class_labels)
  cross_entropy_loss = tf.reduce_mean(cross_entropy)

  # The model implements this operation to find the weights/parameters that would yield correct pixel labels
  train_op = tf.train.AdamOptimizer(learning_rate).minimize(cross_entropy_loss)

  return logits, train_op, cross_entropy_loss


def train_nn(sess, epochs, batch_size, get_batches_fn, train_op,
             cross_entropy_loss, input_image,
             correct_label, keep_prob, learning_rate):
  """
  Train neural network and print out the loss during training.
  sess: TF Session
  epochs: Number of epochs
  batch_size: Batch size
  get_batches_fn: Function to get batches of training data.  Call using get_batches_fn(batch_size)
  train_op: TF Operation to train the neural network
  cross_entropy_loss: TF Tensor for the amount of loss
  input_image: TF Placeholder for input images
  correct_label: TF Placeholder for label images
  keep_prob: TF Placeholder for dropout keep probability
  learning_rate: TF Placeholder for learning rate
  """

  for epoch in range(EPOCHS):
    
    losses, i = [], 0
    
    for images, labels in get_batches_fn(BATCH_SIZE):
        
      i += 1
    
      feed = { input_image: images,
               correct_label: labels,
               keep_prob: DROPOUT,
               learning_rate: LEARNING_RATE }
        
      _, partial_loss = sess.run([train_op, cross_entropy_loss], feed_dict = feed)
      
      print("---> iteration: ", i, " partial loss:", partial_loss)
      losses.append(partial_loss)
          
    training_loss = sum(losses) / len(losses)
    all_training_losses.append(training_loss)
    
    print("------------------")
    print("epoch: ", epoch + 1, " of ", EPOCHS, "training loss: ", training_loss)
    print("------------------")
    

def run_tests():
  tests.test_layers(layers)
  tests.test_optimize(optimize)
  tests.test_for_kitti_dataset(DATA_DIRECTORY)
  tests.test_train_nn(train_nn)


def run():
  """ Run a train a model and save output images resulting from the test image fed on the trained model """

  # Get vgg model if we can't find it where it should be
  helper.maybe_download_pretrained_vgg(DATA_DIRECTORY)

  # A function to get batches
  get_batches_fn = helper.gen_batch_function(TRAINING_DATA_DIRECTORY, IMAGE_SHAPE)
  
  with tf.Session() as session:
        
    # Returns the three layers, keep probability and input layer from the vgg architecture
    image_input, keep_prob, layer3, layer4, layer7 = load_vgg(session, VGG_PATH)

    # The resulting network architecture from adding a decoder on top of the given vgg model
    model_output = layers(layer3, layer4, layer7, NUMBER_OF_CLASSES)

    # Returns the output logits, training operation and cost operation to be used
    # - logits: each row represents a pixel, each column a class
    # - train_op: function used to get the right parameters to the model to correctly label the pixels
    # - cross_entropy_loss: function outputting the cost which we are minimizing, lower cost should yield higher accuracy
    logits, train_op, cross_entropy_loss = optimize(model_output, correct_label, learning_rate, NUMBER_OF_CLASSES)
    
    # Initialize all variables
    session.run(tf.global_variables_initializer())
    session.run(tf.local_variables_initializer())

    # Train the neural network
    train_nn(session, EPOCHS, BATCH_SIZE, get_batches_fn, 
             train_op, cross_entropy_loss, image_input,
             correct_label, keep_prob, learning_rate)

    # Run the model with the test images and save each painted output image (roads painted green)
    helper.save_inference_samples(RUNS_DIRECTORY, DATA_DIRECTORY, session, IMAGE_SHAPE, logits, keep_prob, image_input)

#--------------------------
# MAIN
#--------------------------
if __name__ == "__main__":
  run_tests()
  run() # Run a train a model and save output images resulting from the test image fed on the trained model
  print(all_training_losses)
  
