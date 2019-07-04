
This is my turn-in code for the PID control project of Udacity's Self-Driving Car Engineer Nanodegree Program. For more information please take a look at
the original repository:
- https://github.com/udacity/CarND-PID-Control-Project/

## Related links
- https://www.youtube.com/watch?v=4Y7zG48uHRo 

# REFLECTIONS
Here is the video
- https://youtu.be/ptW-fpZ2Mp4

I used 640 x 480 screen resolution, with a graphic quality of fastest in macOS Sierra Version 10.12.4 Macbook Pro Mid 2014. 2.6 GHz Intel Core i5.

I noticed that it worked only when I wasn't screen recording with Quicktime. Once I do screen-recording it doesn't work anymore so I recorded the video with my phone.

 For each time step we are able to sense the **speed**, **steering angle**, and **cross track error**. The cross track error (CTE) is the error from our desired position in the track. **The steering angle should be between -1 and 1.** The angle of the wheel is between -25 and 25.

The final hyper parameters were chosen by manual tuning to control the steering angle based on the CTE. The parameters where chosen through trial and error and by eyeing the effects. If there are too much oscillations, either the proportional gain was reduced or the derivative gain was increased until it behaves well. The integral term was set to zero. In the future, I will be implementing the parameter optimization algorithm to get better parameters and see how fast we can make the vehicle go.

```c

SimplePIDController steerPid;
steerPid.set(0.12, 0.0, 3.25); // proportional gain = 0.12, derivative gain = 3.25

double steer_value = steerPid.compute(cte);

if (temp > 1.0) { steer_value = 1.0;}
if (temp < -1.0) { steer_value = -1.0;}
```

Here is the effect of each parameter:
### P (proportional control)
-  If the error is small the more conservative the response. If the error is large the more aggressive the response. If this parameter is too large the tendency is to overshoot and miss the desired output. If it's too large the oscillation will be increasing and instead of converging it will diverge. If it's too small, it will take a longer time to get to the desired set point.

### I (integral control)
- The parameter that sets how much we take into
consideration the cumulative error over time.
This is usually used when we see that there is a systematic bias wherein we are not converging to our desired set point. So this is to drive the system towards that set point. This is not used here because it seems like there is no apparent drift.

### D (derivative control)
- This parameter considers the rate of change in the error. If the error is rapidly approaching zero, this parameter will attempt to slow things down to avoid overshooting. If this is too large, then there will be overdamping which means it will take longer to reach the desired goal.
It's possible that even before it reaches its goal, the goal has already changes (for example the car is supposed to straight, now needs to curve). If this is too small, then there will be oscillations as there will be overshooting.

**In addition to this, I also decided to mess with the throttle to control the speed.**

```c

double throttle_value = 1.0;

if (fabs(cte) > 0.6 && fabs(angle) > 7.5 && speed > 50.0) {
  throttle_value = -1.0; // curve
}
```

Basically what this is doing is that if the error is too high, if we are most likely
moving in a curve instead of moving straight based on the steering angle, and the speed is too high,
we should decelerate aggressively, so as to be conservative and not hit the curve; but in all other cases we should accelerate to the maximum allowed value. The parameters here are also tuned manually.

We get speeds as high as more than 95mph when moving straight but most frequently the speed just plays around 65 - 85mph. The minimum speed at the
curves is 50mph.

This is how we compute the result of the PID. I also display values such as the total running error, the average error, and the number of time steps to help us decide how to tune the parameters.

```c
double SimplePIDController::compute(const double error){

  this->n++;
  this->total_square_error += error * error;
  double average_error = this->total_square_error / this->n;

  cout << "#" << this->n
       << " running average: " << average_error
       << " running total: " << this->total_square_error << endl;

  this->p_error = error;
  this->i_error += error;
  this->d_error = error - this->previous_error;
  this->previous_error = error;

  this->r = -1. * (this->Kp * this->p_error +
                   this->Ki * this->i_error +
                   this->Kd * this->d_error);
  return this->r;
}
```

---

## Dependencies

* cmake >= 3.5
 * All OSes: [click here for installation instructions](https://cmake.org/install/)
* make >= 4.1
  * Linux: make is installed by default on most Linux distros
  * Mac: [install Xcode command line tools to get make](https://developer.apple.com/xcode/features/)
  * Windows: [Click here for installation instructions](http://gnuwin32.sourceforge.net/packages/make.htm)
* gcc/g++ >= 5.4
  * Linux: gcc / g++ is installed by default on most Linux distros
  * Mac: same deal as make - [install Xcode command line tools]((https://developer.apple.com/xcode/features/)
  * Windows: recommend using [MinGW](http://www.mingw.org/)
* [uWebSockets](https://github.com/uWebSockets/uWebSockets) == 0.13, but the master branch will probably work just fine
  * Follow the instructions in the [uWebSockets README](https://github.com/uWebSockets/uWebSockets/blob/master/README.md) to get setup for your platform. You can download the zip of the appropriate version from the [releases page](https://github.com/uWebSockets/uWebSockets/releases). Here's a link to the [v0.13 zip](https://github.com/uWebSockets/uWebSockets/archive/v0.13.0.zip).
  * If you run OSX and have homebrew installed you can just run the ./install-mac.sh script to install this
* Simulator. You can download these from the [project intro page](https://github.com/udacity/CarND-PID-Control-Project/releases) in the classroom.

## Basic Build Instructions

1. Clone this repo.
2. Make a build directory: `mkdir build && cd build`
3. Compile: `cmake .. && make`
4. Run it: `./pid`.
