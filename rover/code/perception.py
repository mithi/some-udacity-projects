import numpy as np
import cv2


'''
Returns an image `warped_img` by performing a perspective transform to an image `image`
given four source points and corresponding destination points
'''
def transform_perspective(img, src, dst):
  transform_matrix = cv2.getPerspectiveTransform(src, dst)
  dimensions = (img.shape[1], img.shape[0]) # keep same size as input image
  warped_img = cv2.warpPerspective(img, transform_matrix, dimensions)

  return warped_img


'''
A color thresholding function which dentify pixels above and below given thresholds
`img` is a BGR image, convers this BGR to HLS
`thresh_min` and `thesh_max` are minimum and maximum tresholds are tuples of three elements
which are respective HLS channels
'''
def filter_hls(img, thresh_min, thresh_max, height = None):

  hls_img = img.copy() # make a copy
  cv2.cvtColor(hls_img, cv2.COLOR_BGR2HLS) # convert image to hls

  # an array of zeros same xy size as img, but single channel
  binary_img = np.zeros_like(img[:,:,0])

  # Require that each pixel be above all three threshold values in HLS
  # within_thresh will now contain a boolean array with "True" where threshold was met
  within_thresh = (hls_img[:,:,0] >= thresh_min[0]) & (hls_img[:,:,0] <= thresh_max[0]) & \
                  (hls_img[:,:,1] >= thresh_min[1]) & (hls_img[:,:,1] <= thresh_max[1]) & \
                  (hls_img[:,:,2] >= thresh_min[2]) & (hls_img[:,:,2] <= thresh_max[2])

  # Index the array of zeros with the boolean array and set to 1
  binary_img[within_thresh] = 1

  if height is not None:
    binary_img[:height, :] = 0

  return binary_img


'''
Converts from image coordinates to rover coodinates from a binary image
returns a list of x and a list of y values
'''
def get_rover_coordinates(xs, ys, h, w):
  
  # Calculate positions with reference to the rover position being at the center bottom of the image
  xs_rover = -(ys - h)
  ys_rover = -(xs - w / 2 )
  
  return xs_rover, ys_rover


'''
Converts to polar coordinates from rover space
Convert all a list of x's and a list of y's to a list of distances and a list of angles
'''
def convert_to_polar(xs, ys):
  
  distances = np.sqrt(xs**2 + ys**2)
  angles = np.arctan2(ys, xs)
  
  return distances, angles


'''
Applies rotation and translation (and clipping based on `world_size`)
`xs`, `ys` are pixels in rover space to be converted
x_pos`, `y_pos` are the coordinates of the rover with respect to the world in world_map coordinates
yaw` is the orientation of the rover with respect to the world
`scale` is the ratio of rover to world pixels
'''
def convert_rover_to_world_coordinates(xs, ys, x_pos, y_pos, yaw, world_size, scale):

  # Convert yaw to radians
  a = yaw * np.pi / 180

  # rotate
  xs_rotated = (xs * np.cos(a)) - (ys * np.sin(a))
  ys_rotated = (xs * np.sin(a)) + (ys * np.cos(a))

  # scale and translate
  xs_world = xs_rotated / scale + x_pos
  ys_world = ys_rotated / scale + y_pos

  #clip
  xs_world = np.clip(np.int_(xs_world), 0, world_size - 1)
  ys_world = np.clip(np.int_(ys_world), 0, world_size - 1)

  return xs_world, ys_world


'''
get precomputed destination and source points
'''
def get_warp_points():

  destination_points = np.float32([[155, 155], [165, 155], [165, 145], [155, 145]])
  source_points = np.float32([[14, 140], [301 ,140],[200, 96], [118, 96]])

  return source_points, destination_points


class PerceivedObjectOfInterest:
  # cam: direct from the camera image
  # warped :transformed perspective from the camera image
  # rover: in rover coordinate system transformed from warped perspective
  # world: in world coordinate system transformed from rover's coordinate system
  # bin: binary image

  def __init__(self, img):

    self.img = img
    self.cam_bin = None
    self.warped_bin = None
    self.cam_xs, self.cam_ys = None, None
    self.warped_xs, self.warped_ys = None, None
    self.rover_xs, self.rover_ys = None, None
    self.world_xs, self.world_ys = None, None
    self.size = None
    self.ds, self.angles = None, None
    self.d, self.angle = None, None
    self.mean_x, self.mean_y = None, None

  def do_thresholding(self, thresh_min, thresh_max, height = None):
    # Threshold in the HLS channel
    self.cam_bin = filter_hls(self.img, thresh_min, thresh_max, height)
    # Store non zero pixels
    self.cam_ys, self.cam_xs = self.cam_bin.nonzero()

  def warp(self, source_points, destination_points):

    # Transform_perspective
    self.warped_bin = transform_perspective(self.cam_bin, source_points, destination_points)
    self.warped_ys, self.warped_xs = self.warped_bin.nonzero()

    # Get rover coordinates
    self.rover_xs, self.rover_ys = get_rover_coordinates(
      self.warped_xs, self.warped_ys, self.warped_bin.shape[0], self.warped_bin.shape[1])

    # Get the mean x, and mean y of the rover coordinates pixels
    # Get other properties based on the image
    self.size = len(self.rover_xs)
    self.ds, self.angles = convert_to_polar(self.rover_xs, self.rover_ys)
    self.d, self.angle = np.mean(self.ds), np.mean(self.angles)
    self.mean_x, self.mean_y = np.mean(self.warped_xs), np.mean(self.warped_ys)

    if np.isnan(self.d) or np.isnan(self.angle):
      self.d, self.angle = 0, 0
      self.mean_x, self.mean_y = 0, 0

  def compute_world_coordinates(self, pos_x, pos_y, yaw, world_size, scale):
    self.world_xs, self.world_ys = convert_rover_to_world_coordinates(
      self.rover_xs, self.rover_ys, pos_x, pos_y, yaw, world_size, scale)


'''
Analyze incoming image data
'''
def perception_step(Rover):

  # Get Rover's current position and heading, and camera image
  pos_x, pos_y, yaw, img = Rover.pos[0], Rover.pos[1], Rover.yaw, Rover.img

  # Set up world_size and scale which is the rover pixels / world pixels ratio
  world_size, scale = 200, 30

  # Calculate source and destination points for perspective transform later
  source_points, destination_points = get_warp_points()

  #############################################################################
  # Given the incoming image, compute perceived properties for the following:
  # navigable (ground), samples (rock), obstacles (blocked) pixels
  #############################################################################
  Ground = PerceivedObjectOfInterest(img)
  Ground.do_thresholding(thresh_min = (0, 100, 70), thresh_max = (255, 255, 255), height = 70)
  Ground.warp(source_points, destination_points)
  Ground.compute_world_coordinates(pos_x, pos_y, yaw, world_size, scale)

  Rock = PerceivedObjectOfInterest(img)
  Rock.do_thresholding(thresh_min = (0, 100, 0), thresh_max = (255, 255, 70))
  Rock.warp(source_points, destination_points)
  Rock.compute_world_coordinates(pos_x, pos_y, yaw, world_size, scale)

  Blocked = PerceivedObjectOfInterest(img)
  Blocked.do_thresholding(thresh_min = (0, 0, 0), thresh_max = (255, 100, 255))
  Blocked.warp(source_points, destination_points)
  Blocked.compute_world_coordinates(pos_x, pos_y, yaw, world_size, scale)

  #############################################################################
  #  Update worldmap
  #############################################################################
  Rover.worldmap[Ground.world_ys, Ground.world_xs, 2] = 255
  Rover.worldmap[Rock.world_ys, Rock.world_xs, 1] = 255
  Rover.worldmap[Blocked.world_ys, Blocked.world_xs, 0] = 255

  #############################################################################
  # Update Rover angles and distances of interest
  #############################################################################
  angle, angles, ds = Ground.angle, Ground.angles, Ground.ds
  Rover.found_rock = False
  Rover.ground_pixels_count = Ground.size

  if Rock.size > 2: # Found rock
    print("Sees rock")
    # Override angle
    Rover.found_rock = True
    angle, angles, ds = Rock.angle, Rock.angles, Rock.ds

  Rover.nav_dists, Rover.nav_angles = ds, angles
  Rover.angle = angle * 180 / np.pi

  #############################################################################
  # Get the mean location to display our direction
  #############################################################################
  mean_x, mean_y = int(Ground.mean_x), int(Ground.mean_y)

  if Rover.found_rock:
    mean_x, mean_y = int(Rock.mean_x), int(Rock.mean_y)

  #############################################################################
  # Update vision_image
  #############################################################################

  # Wipe out vision_image to be a clean slate
  Rover.vision_image = Rover.vision_image * 0;

  # Navigable terrain is blue, rock is green, obstacles is red
  Rover.vision_image[Ground.warped_ys, Ground.warped_xs, 0] = 255
  Rover.vision_image[Rock.warped_ys, Rock.warped_xs, 1] = 255
  Rover.vision_image[Blocked.warped_ys, Blocked.warped_xs, 2] = 255
  cv2.line(Rover.vision_image, (160, 160),(mean_x, mean_y), [0, 255, 0], 3)

  return Rover
