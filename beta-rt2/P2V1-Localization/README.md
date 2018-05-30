# Localization Project ReadMe

## My Setup 

1. Native install Ubuntu 16.04 on a Mac (DualBoot )
- [Instructions from Greg's Tech Guru](https://www.youtube.com/watch?v=IQIaDO9nR6Y)

2. Install ROS Desktop Full Install - on Ubuntu
- [Ros Wiki](http://wiki.ros.org/kinetic/Installation/Ubuntu)

3. Install Kinetic Navigation stack if not available
- ` Install Kinetic Navigation `

4. Clone this Repo

5. Go inside the **localization project**) directory and then `~/catkin_ws/`

6. Run the following:
``` 
$ catkin_make
$ source devel/setup.bash
$.roslaunch udacity_bot udacity_world.launch
```

7. On a separate terminal 
```
$ source devel/setup.bash
$ roslaunch udacity_bot amcl.launch
```

8. In RViz


### In Rviz,
- select “odom” for fixed frame
- click the “Add” button and 
- - add “RobotModel”
- - add “Map” and select first topic /map. The second and third topics in the list will show the global costmap, and the local costmap.
- - add “PoseArray” and select topic /particlecloud. This will display a set of arrows around in your map. Each arrow is essentially a particle defining the pose of the robot that the localization package created. 

### In RViz in the toolbar, 
- Select “2D Nav Goal” click anywhere else on the map and drag from there to define the goal position along with the orientation of the robot at the goal position.

The robot should navigate from starting goal position to your defined goal position. 