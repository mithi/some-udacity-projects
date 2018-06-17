
# Introduction
- This is my turn-in code for the first project for the fulfillment of Udacity's Robotics Nanodegree.
- This project is modeled after
the [NASA Sample and Return Challenge](https://www.nasa.gov/directorates/spacetech/centennial_challenges/sample_return_robot/index.html).
- Fulfillment of this project gives first hand experience on the three essential elements of robotics, which are perception, decision making and actuation. The project is carried out in a simulator environment built with the Unity game engine.
- For more information about this project, check
[the starter code as provided by Udacity](https://github.com/udacity/RoboND-Rover-Project)


# [WRITEUP](./WRITEUP.md)

# Videos
- [Notebook Analysis Output Video](./output/test_mapping.mp4)
- [Screen Recording (with latency, so rover wobbles)](https://youtu.be/abqHyHql_EY)
- [Recorded via iPhone (no lag)](https://youtu.be/GiGVlfZQzI0)
- The videos were recorded in real-time and was sped up with `ffmpeg`
```
$ brew install ffmpeg
$ ffmpeg -i video.mov -r 24 -filter:v "setpts=0.25*PTS" -an output.mov
$ ffmpeg -i output.mov -vcodec copy -acodec copy output.mp4
```

# Dependencies

### Python 3, Jupyter Notebooks and Anaconda
- [RoboND Python Starter Kit](https://github.com/ryan-keenan/RoboND-Python-Starterkit)
- [Walkthrough: How to configure all dependencies via Anaconda](https://github.com/ryan-keenan/RoboND-Python-Starterkit/blob/master/doc/configure_via_anaconda.md)

### Simulator
- Download depending on your OS:
- - [Linux](https://s3-us-west-1.amazonaws.com/udacity-robotics/Rover+Unity+Sims/Linux_Roversim.zip)
- - [Mac](https://s3-us-west-1.amazonaws.com/udacity-robotics/Rover+Unity+Sims/Mac_Roversim.zip)
- - [Windows](https://s3-us-west-1.amazonaws.com/udacity-robotics/Rover+Unity+Sims/Windows_Roversim.zip)
- - I tested mine in macOS Sierra 10.12.5 MacBook Pro (Retina, 13-inch, Mid 2014)


# Data Analysis

### Recording Data
- The `rover_playground.ipynb` notebook in the `code` folder analyzes my recorded data from the simulator as well as images that can be found at `calibration_images` folder.
- I have recorded the data using the following steps:
- - launch the simulator
- - choose "Training Mode"
- - hit "r".
- -  Navigate to the directory you want to store data in
- - select it
- - drive around collecting data
- - Hit "r" again to stop data collection.

### How To Use
- In the root directory you will see `dataset.zip`, extract this to create
the `dataset` folder with contains the recorded data.
- Go inside the `code` folder located at the root directory in your terminal
- Activate environment and launch jupyter notebook
```
$ source activate RoboND
$ Jupyter notebook &
```
- Select `rover_playground.ipynb` with the launched browser
- All cells should run as is, and are sufficiently commented so that you can easily modify as you wish
- Running all the cells in this folder outputs a video that is stored at the `output` folder named `test_mapping.mp4`


# Navigating Autonomously
- Go inside the `code` folder located at the root directory in your terminal
- Activate environment and launch jupyter notebook
```
$ source activate RoboND
```
- Run `drive_rover.py`
```
$ python driver_rover.py
```
- Launch the simulator
- I chose an 840 x 520 resolution with the graphic quality of 'good'
- Choose _'Autonomous Mode'_
- The rover should drive itself
