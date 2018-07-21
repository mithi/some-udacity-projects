# Behavioral Cloning

In this project, I have used what I've learned about deep neural networks and convolutional neural networks to clone 
driving behavior. I trained, validated and tested a model using Keras. The model outputs a steering angle to be used by an autonomous vehicle.

I have built and trained a convolutional neural network for end-to-end driving in a simulator, using TensorFlow and Keras.  I have used optimization techniques such as regularization and dropout to generalize the network for driving on multiple tracks.

# Relevant Links
- A medium article about this project
- - https://medium.com/@mithi/cloning-driving-behavior-with-videogame-like-simulator-and-keras-e31129a8e3b6
- My submitted detailed technical write-up
- - https://github.com/mithi/behavioral-cloning/blob/master/writeup_report.pdf
- The model was largely based from Comma.Ai's code and paper
- - https://github.com/commaai/research/blob/master/train_steering_model.py
- - https://arxiv.org/pdf/1608.01230.pdf
- Check the original project repository
- - https://github.com/udacity/CarND-Behavioral-Cloning-P3
- The simulator that was used can be downloaded here
- - https://d17h27t6h515a5.cloudfront.net/topher/2017/February/58ae4594_mac-sim.app/mac-sim.app.zip
- The data used to train this model 
- - https://d17h27t6h515a5.cloudfront.net/topher/2016/December/584f6edd_data/data.zip

# How to use 

## 1. Preliminaries
- Please check the original project repository for more details
- - https://github.com/udacity/CarND-Behavioral-Cloning-P3
- But essentially you'd need to set up the dependencies as outlined the link below
- - https://github.com/udacity/CarND-Term1-Starter-Kit
-  Install the simulator app
- - https://d17h27t6h515a5.cloudfront.net/topher/2017/February/58ae4594_mac-sim.app/mac-sim.app.zip

## 2. Run `model.py`
- Running `model.py` essentially trains a model which it saves at the file `model.h5`
- This file uses the data from a `.csv` file which points to corresponding locations of the images in your computer 
```
python model.py 
```
- You can collect your own images and generate your own `.csv` file but the images I used can be found here
- - https://d17h27t6h515a5.cloudfront.net/topher/2016/December/584f6edd_data/data.zip
- - https://raw.githubusercontent.com/mithi/behavioral-cloning/master/data/driving_log.csv
- The script `model.py` is roughly only 120 lines long so it should be easy to read and it should be easy for you to modify as you see fit, but you can also check the following links to understand how it works better
- - https://medium.com/@mithi/cloning-driving-behavior-with-videogame-like-simulator-and-keras-e31129a8e3b6
- - https://github.com/mithi/behavioral-cloning/blob/master/writeup_report.pdf

## 3. Run `drive.py`
- After training, run `drive.py` like this 
```
python drive.py model.h5 run1
```
- Open your simulator at autonomous mode and hopefuly the car behaves the way you want it to behave. 
- `run1` is the directory in which to save the images seen
- The image file name is a timestamp of when the image was seen. 
- This information is used by `video.py` to create a chronological video of the agent driving.

## 4. Run `video.py`
This creates a video based on images found in the `run1` directory. The name of the video will be the name of the directory followed by '`.mp4`', so, in this case the video will be `run1.mp4`.
```
python video.py run1
```

# AFTERTHOUGHTS: Recommendation for Improvements
- Switch the following two lines in the model `model.add(Lambda(lambda x: (x / 127.5) - 1., input_shape = (160, 320, 3)))` and  `model.add(Cropping2D(cropping=((70, 25), (0, 0)), input_shape = (160, 320, 3)))` because what's the point of normalizing some values when you are going to crop them after (I.E. you don't use them anyway)
- Use the augmentation techniques discussed by [Vivek](chatbotslife.com/using-augmentation-to-mimic-human-driving-496b569760a9#.wrw8mbdmd) and [Navoshta](navoshta.com/end-to-end-deep-learning/) so that the model could generalize in other tracks such as track 2. This includes adding random shadows, vertical and horizontal shifting, and brightness tweaking.
- Gather your own data using data collection techniques such as center lane driving and recovery driving to have a more balanced data set. 

# Videos

**Video of Autonomous Driving - Track 1 (success)**
- (ver1) run1.mp4

**Video of Autonomous Driving - Track 2 (fail)**
- (ver1) run2.mp4

#  Second version (retrained)
- **/ver2** 
- *(model.py, model.H5, model.json, model_data.txt)*

