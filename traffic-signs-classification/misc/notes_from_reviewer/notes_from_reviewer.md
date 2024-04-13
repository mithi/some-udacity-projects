
# Notes from Reviewer 

### Good Deep Learning books which are also recommended by Elon Musk 
- https://github.com/HFTrader/DeepLearningBook
- http://www.fast.ai/
- http://yerevann.com/a-guide-to-deep-learning/

### Resources for preprocessing techniques
- http://people.idsia.ch/~juergen/nn2012traffic.pdf
- http://people.idsia.ch/~juergen/ijcnn2011.pdf
- http://www.irdindia.in/journal_ijraet/pdf/vol1_iss3/27.pdf

### Tensor board - a good visualization tool to better visualize the adopted architecture 
- https://www.tensorflow.org/versions/r0.12/how_tos/graph_viz/

### Training the model 
- Nice discussion on how to choose batch_size - http://stats.stackexchange.com/questions/140811/how-large-should-the-batch-size-be-for-stochastic-gradient-descent
- A discussion on Adam Optimizer - http://sebastianruder.com/optimizing-gradient-descent/index.html#adam

###  An interesting inception examples
- https://github.com/tflearn/tflearn/blob/master/examples/images/googlenet.py

### Factors that affect classification 
-  http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.144.5021&rep=rep1&type=pdf

############

Here are a few ideas for going beyond the requirements outlined in the rubric.

AUGMENT THE TRAINING DATA
Augmenting the training set might help improve model performance. Common data augmentation techniques include rotation, translation, zoom, flips, and/or color perturbation. These techniques can be used individually or combined.

ANALYZE NEW IMAGE PERFORMANCE IN MORE DETAIL
Calculating the accuracy on these five German traffic sign images found on the web might not give a comprehensive overview of how well the model is performing. Consider ways to do a more detailed analysis of model performance by looking at predictions in more detail. For example, calculate the precision and recall for each traffic sign type from the test set and then compare performance on these five new images..

If one of the new images is a stop sign but was predicted to be a bumpy road sign, then we might expect a low recall for stop signs. In other words, the model has trouble predicting on stop signs. If one of the new images is a 100 km/h sign but was predicted to be a stop sign, we might expect precision to be low for stop signs. In other words, if the model says something is a stop sign, we're not very sure that it really is a stop sign.

Looking at performance of individual sign types can help guide how to better augment the data set or how to fine tune the model.

CREATE VISUALIZATIONS OF THE SOFTMAX PROBABILITIES
For each of the five new images, create a graphic visualization of the soft-max probabilities. Bar charts might work well.

VISUALIZE LAYERS OF THE NEURAL NETWORK
See Step 4 of the Iptyon notebook for details about how to do this.
