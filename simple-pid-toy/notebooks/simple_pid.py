from numpy import cos, sin, tan, pi, sqrt
from random import gauss
from copy import deepcopy

class Car:

  def __init__(self, 
               position = {'x': 0., 'y': 10., 'theta': 0.},
               settings = {'tolerance': 0.001, 
                           'length': 20.,
                           'max_steering': pi / 4.,
                           'steering_drift': 10. * pi / 180.,
                           'steering_noise': pi / 100.,
                           'speed_noise': 0.01
                           }):
    
    self.x, self.y, self.theta = position['x'], position['y'], position['theta']
    
    self.tolerance = settings['tolerance']
    self.length = settings['length']
    self.max_steering = settings['max_steering']
    self.drift = settings['steering_drift']
    self.steering_noise = settings['steering_noise']
    self.speed_noise = settings['speed_noise']
  
  def set(self, x, y, theta):
    self.x = x 
    self.y = y
    self.theta = theta

  def move(self, steering, speed, dt):
    
    # steering angle - add noise and bound to max steering angle
    steering = steering + gauss(0., self.steering_noise) + self.drift
    steering = max(min(steering, self.max_steering), -self.max_steering)
    
    # distance travelled - add noise and must only move forward
    distance = (speed + gauss(0., self.speed_noise)) * dt 
    distance = max(0, distance)
    
    turn = distance / self.length * tan(steering)
    
    if turn < self.tolerance: # move straight
        
      self.x += distance * cos(self.theta)
      self.y += distance * sin(self.theta)
      self.theta = (self.theta + turn) % (2 * pi)
    
    else:
    
      r = distance / turn
      phi = (self.theta + turn) % (2 * pi)
      self.x += (r * sin(phi) - r * sin(self.theta))
      self.y += (r * cos(self.theta) - r * cos(phi))
      self.theta = phi
        

##########################
# try to follow a line with given PID parameters at n timesteps 
# with given car settings and car initial poistion
#########################
def follow_line(tp, ti, td, n, car_settings, initial_position):
    
  car_history, error_history = [], []
  car = Car(position = initial_position, settings = car_settings)
  
  previous_error = car.y
  total_error = 0.

  for i in range(n):
        
    error = car.y
    derror = error - previous_error    
    angle = -tp * error + -ti * total_error + - td * derror

    car.move(speed = 1., dt = 1., steering = angle)
    
    total_error += error
    previous_error = error
    
    car_history.append(deepcopy(car))
    error_history.append(abs(error))

  return car_history, error_history


##########################
# parameter optimization
#########################
def twiddle(p = [0.495, 0.0013, 4.475], 
            dp = [0.01, 0.001, 0.1],
            big_factor = 1.1, 
            small_factor = 0.9,
            N = 1000,
            func = follow_line, 
            n = 300,
            settings = {'tolerance': 0.001, 
                        'length': 20.,
                        'max_steering': pi / 4.,
                        'steering_drift': 10. * pi / 180.,
                        'steering_noise': 0.,
                        'speed_noise': 0.0},
            position = {'x': 0., 'y': 10., 'theta': 0.}
            ):
    
  def run(x): 
    tp, ti, td = x[0], x[1], x[2]
    _, error_history = func(tp, ti, td, n, settings, position)
    error = sum(error_history[-100:]) / 100 # average error of last 100 items
    return error

  best_error = run(p)

  for c in range(N):
    
    print('tp:', p[0], 'ti:', p[1], 'td:', p[2], 'error:', best_error)
        
    for i in range(len(p)):
        
      p[i] += dp[i] # add a little to this control gain 
      error = run(p) # compute the average error
    
      if abs(error) < abs(best_error):
        # if the error is better, be more aggressive in tweaking
        # this control gain the next time around
        # proceed to the tuning the next control gain
        best_error = error
        dp[i] *= big_factor
        
      else:

        # if the error is worse, roll back to your previous control gain 
        p[i] -= 2 * dp[i]
        error = run(p)
            
        # after rolling back, check if this error is better
        # if it is, be more aggressive in tweaking
        # this control gain next time around
        # proceed to the tuning the next control gain
        if abs(error) < abs(best_error):
          best_error = error
          dp[i] *= big_factor
            
        else:
          # if the error is worst after rolling back
          # be more conservative (less aggressive)
          # in tweaking this control gain 
          # the next time around
          # proceed to the tuning the next control gain
          p[i] += dp[i]
          dp[i] *= small_factor      

  print()
  print("best parameters:", p)
  print("(dp):", dp)
  tp, ti, td = p[0], p[1], p[2]
  _, error_history = func(tp, ti, td, n, settings, position)
  print("last error:", error_history[-1])
  print("average error of last 100 steps:", sum(error_history[-100:]) / 100)
  print ("average error", sum(error_history) / len(error_history))
    

##########################
# cross track error to follow a specific race track geometry
#########################
def cte(car, r = 25.):

  if car.x < r:
    e = sqrt((car.x - r) ** 2 + (car.y - r) ** 2) - r
  elif car.x > 3. * r:
    e = sqrt((car.x - 3 *r) ** 2 + (car.y - r) ** 2) - r
  elif car.y > r:
    e = car.y - 2. * r
  else:
    e = -car.y # moving at opposite direction
  
  return e


##########################
# follow a specific race track geometry
#########################  
def follow_race_track(tp = 10., ti = 0., td = 15., n = 300, 
  car_settings = {'tolerance': 0.001, 
                  'length': 20.,
                  'max_steering': pi / 4.,
                  'steering_drift': 10. * pi / 180.,
                  'steering_noise': pi / 100.,
                  'speed_noise': 0.01
                  }, 
  initial_position = {'x': 0., 'y': 25.,'theta': pi / 2.}):
  
  car_history, error_history = [], []

  car = Car(position = initial_position, settings = car_settings)
  
  total_error = 0.
  derror = 0.
  previous_error = cte(car)

  for i in range(n):
    
    error = cte(car)
    derror = error - previous_error
    angle = -tp * error + -ti * total_error + -td * derror
    
    car.move(speed = 1., dt = 1., steering = angle)
        
    total_error += error
    previous_error = error

    car_history.append(deepcopy(car))
    error_history.append(error)

  return car_history, error_history
    
