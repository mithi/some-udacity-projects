import matplotlib.colors
import matplotlib.pyplot as plt
import numpy as np
from pcl_helper import *


def rgb_to_hsv(color):
  r, g, b = color[0], color[1], color[2] 
  rgb_normalized = [1.0 * r / 255, 1.0 * g / 255, 1.0 * b / 255]
  hsv_normalized = matplotlib.colors.rgb_to_hsv([[rgb_normalized]])[0][0]
  return hsv_normalized


# Concatenates each of the three histogram and normalize the results
def get_normalized_feature_set(ch1, ch2, ch3, n_bins = 64, range_bins = (0, 256)):

  # Compute histogram of each channel 
  ch1_hist = np.histogram(ch1, bins = n_bins, range = range_bins)
  ch2_hist = np.histogram(ch2, bins = n_bins, range = range_bins)
  ch3_hist = np.histogram(ch3, bins = n_bins, range = range_bins)

  # Concatenate all histograms into one array
  histograms = np.concatenate((ch1_hist[0], ch2_hist[0], ch3_hist[0])).astype(np.float64)

  # Normalize histograms set
  normalized_histograms = histograms / np.sum(histograms)
  return normalized_histograms


# Separates point vector (p1, p2, p3) into their own lists
def separate_channels(points):
  ch1, ch2, ch3 = [], [], []

  for point in points:
    ch1.append(point[0])
    ch2.append(point[1])
    ch3.append(point[2])

  return ch1, ch2, ch3


# Generates a feature set composed of the normalized histogram of 
# each color channel for each point in the point cloud
def compute_color_histograms(cloud, using_hsv = False):

  # Convert each cloud point's color in float format to a three channel format
  # point format: [x, y, z, color_in_float]

  colors = []
  cloud_points = pc2.read_points(cloud, skip_nans = True)

  for point in cloud_points:

    rgb_color = float_to_rgb(point[3])

    if using_hsv:
      colors.append(rgb_to_hsv(rgb_color) * 255)
    else:
      colors.append(rgb_color)

  # Put each color channel in their own list
  ch1, ch2, ch3 = separate_channels(colors)  

  # Concatenate each histogram and normalize the results
  features = get_normalized_feature_set(ch1, ch2, ch3, n_bins = 64, range_bins = (0, 256))
  return features


# Generates a feature set composed of the normalized histogram 
# of normal vectors (nx, nz, nz) for each point in the cloud
def compute_normal_histograms(normal_cloud):
    
  cloud_points = pc2.read_points(normal_cloud,
    field_names = ('normal_x', 'normal_y', 'normal_z'), skip_nans = True)

  # Put each normal component to their own list
  nx_vals, ny_vals, nz_vals = separate_channels(cloud_points)

  # Concatenate each histogram and normalize the results
  features = get_normalized_feature_set(nx_vals, ny_vals, nz_vals, n_bins = 64, range_bins = (0, 256))
  return features

