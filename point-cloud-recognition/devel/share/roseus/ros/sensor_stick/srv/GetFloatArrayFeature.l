;; Auto-generated. Do not edit!


(when (boundp 'sensor_stick::GetFloatArrayFeature)
  (if (not (find-package "SENSOR_STICK"))
    (make-package "SENSOR_STICK"))
  (shadow 'GetFloatArrayFeature (find-package "SENSOR_STICK")))
(unless (find-package "SENSOR_STICK::GETFLOATARRAYFEATURE")
  (make-package "SENSOR_STICK::GETFLOATARRAYFEATURE"))
(unless (find-package "SENSOR_STICK::GETFLOATARRAYFEATUREREQUEST")
  (make-package "SENSOR_STICK::GETFLOATARRAYFEATUREREQUEST"))
(unless (find-package "SENSOR_STICK::GETFLOATARRAYFEATURERESPONSE")
  (make-package "SENSOR_STICK::GETFLOATARRAYFEATURERESPONSE"))

(in-package "ROS")

(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))




(defclass sensor_stick::GetFloatArrayFeatureRequest
  :super ros::object
  :slots (_cluster ))

(defmethod sensor_stick::GetFloatArrayFeatureRequest
  (:init
   (&key
    ((:cluster __cluster) (instance sensor_msgs::PointCloud2 :init))
    )
   (send-super :init)
   (setq _cluster __cluster)
   self)
  (:cluster
   (&rest __cluster)
   (if (keywordp (car __cluster))
       (send* _cluster __cluster)
     (progn
       (if __cluster (setq _cluster (car __cluster)))
       _cluster)))
  (:serialization-length
   ()
   (+
    ;; sensor_msgs/PointCloud2 _cluster
    (send _cluster :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; sensor_msgs/PointCloud2 _cluster
       (send _cluster :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; sensor_msgs/PointCloud2 _cluster
     (send _cluster :deserialize buf ptr-) (incf ptr- (send _cluster :serialization-length))
   ;;
   self)
  )

(defclass sensor_stick::GetFloatArrayFeatureResponse
  :super ros::object
  :slots (_feature ))

(defmethod sensor_stick::GetFloatArrayFeatureResponse
  (:init
   (&key
    ((:feature __feature) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _feature __feature)
   self)
  (:feature
   (&optional __feature)
   (if __feature (setq _feature __feature)) _feature)
  (:serialization-length
   ()
   (+
    ;; float32[] _feature
    (* 4    (length _feature)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32[] _feature
     (write-long (length _feature) s)
     (dotimes (i (length _feature))
       (sys::poke (elt _feature i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32[] _feature
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _feature (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _feature i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(defclass sensor_stick::GetFloatArrayFeature
  :super ros::object
  :slots ())

(setf (get sensor_stick::GetFloatArrayFeature :md5sum-) "c90ae3a91de76e55487209150231b931")
(setf (get sensor_stick::GetFloatArrayFeature :datatype-) "sensor_stick/GetFloatArrayFeature")
(setf (get sensor_stick::GetFloatArrayFeature :request) sensor_stick::GetFloatArrayFeatureRequest)
(setf (get sensor_stick::GetFloatArrayFeature :response) sensor_stick::GetFloatArrayFeatureResponse)

(defmethod sensor_stick::GetFloatArrayFeatureRequest
  (:response () (instance sensor_stick::GetFloatArrayFeatureResponse :init)))

(setf (get sensor_stick::GetFloatArrayFeatureRequest :md5sum-) "c90ae3a91de76e55487209150231b931")
(setf (get sensor_stick::GetFloatArrayFeatureRequest :datatype-) "sensor_stick/GetFloatArrayFeatureRequest")
(setf (get sensor_stick::GetFloatArrayFeatureRequest :definition-)
      "sensor_msgs/PointCloud2 cluster

================================================================================
MSG: sensor_msgs/PointCloud2
# This message holds a collection of N-dimensional points, which may
# contain additional information such as normals, intensity, etc. The
# point data is stored as a binary blob, its layout described by the
# contents of the \"fields\" array.

# The point cloud data may be organized 2d (image-like) or 1d
# (unordered). Point clouds organized as 2d images may be produced by
# camera depth sensors such as stereo or time-of-flight.

# Time of sensor data acquisition, and the coordinate frame ID (for 3d
# points).
Header header

# 2D structure of the point cloud. If the cloud is unordered, height is
# 1 and width is the length of the point cloud.
uint32 height
uint32 width

# Describes the channels and their layout in the binary data blob.
PointField[] fields

bool    is_bigendian # Is this data bigendian?
uint32  point_step   # Length of a point in bytes
uint32  row_step     # Length of a row in bytes
uint8[] data         # Actual point data, size is (row_step*height)

bool is_dense        # True if there are no invalid points

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id

================================================================================
MSG: sensor_msgs/PointField
# This message holds the description of one point entry in the
# PointCloud2 message format.
uint8 INT8    = 1
uint8 UINT8   = 2
uint8 INT16   = 3
uint8 UINT16  = 4
uint8 INT32   = 5
uint8 UINT32  = 6
uint8 FLOAT32 = 7
uint8 FLOAT64 = 8

string name      # Name of field
uint32 offset    # Offset from start of point struct
uint8  datatype  # Datatype enumeration, see above
uint32 count     # How many elements in the field
---
float32[] feature

")

(setf (get sensor_stick::GetFloatArrayFeatureResponse :md5sum-) "c90ae3a91de76e55487209150231b931")
(setf (get sensor_stick::GetFloatArrayFeatureResponse :datatype-) "sensor_stick/GetFloatArrayFeatureResponse")
(setf (get sensor_stick::GetFloatArrayFeatureResponse :definition-)
      "sensor_msgs/PointCloud2 cluster

================================================================================
MSG: sensor_msgs/PointCloud2
# This message holds a collection of N-dimensional points, which may
# contain additional information such as normals, intensity, etc. The
# point data is stored as a binary blob, its layout described by the
# contents of the \"fields\" array.

# The point cloud data may be organized 2d (image-like) or 1d
# (unordered). Point clouds organized as 2d images may be produced by
# camera depth sensors such as stereo or time-of-flight.

# Time of sensor data acquisition, and the coordinate frame ID (for 3d
# points).
Header header

# 2D structure of the point cloud. If the cloud is unordered, height is
# 1 and width is the length of the point cloud.
uint32 height
uint32 width

# Describes the channels and their layout in the binary data blob.
PointField[] fields

bool    is_bigendian # Is this data bigendian?
uint32  point_step   # Length of a point in bytes
uint32  row_step     # Length of a row in bytes
uint8[] data         # Actual point data, size is (row_step*height)

bool is_dense        # True if there are no invalid points

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id

================================================================================
MSG: sensor_msgs/PointField
# This message holds the description of one point entry in the
# PointCloud2 message format.
uint8 INT8    = 1
uint8 UINT8   = 2
uint8 INT16   = 3
uint8 UINT16  = 4
uint8 INT32   = 5
uint8 UINT32  = 6
uint8 FLOAT32 = 7
uint8 FLOAT64 = 8

string name      # Name of field
uint32 offset    # Offset from start of point struct
uint8  datatype  # Datatype enumeration, see above
uint32 count     # How many elements in the field
---
float32[] feature

")



(provide :sensor_stick/GetFloatArrayFeature "c90ae3a91de76e55487209150231b931")


