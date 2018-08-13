; Auto-generated. Do not edit!


(cl:in-package sensor_stick-srv)


;//! \htmlinclude GetNormals-request.msg.html

(cl:defclass <GetNormals-request> (roslisp-msg-protocol:ros-message)
  ((cluster
    :reader cluster
    :initarg :cluster
    :type sensor_msgs-msg:PointCloud2
    :initform (cl:make-instance 'sensor_msgs-msg:PointCloud2)))
)

(cl:defclass GetNormals-request (<GetNormals-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetNormals-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetNormals-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sensor_stick-srv:<GetNormals-request> is deprecated: use sensor_stick-srv:GetNormals-request instead.")))

(cl:ensure-generic-function 'cluster-val :lambda-list '(m))
(cl:defmethod cluster-val ((m <GetNormals-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sensor_stick-srv:cluster-val is deprecated.  Use sensor_stick-srv:cluster instead.")
  (cluster m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetNormals-request>) ostream)
  "Serializes a message object of type '<GetNormals-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'cluster) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetNormals-request>) istream)
  "Deserializes a message object of type '<GetNormals-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'cluster) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetNormals-request>)))
  "Returns string type for a service object of type '<GetNormals-request>"
  "sensor_stick/GetNormalsRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetNormals-request)))
  "Returns string type for a service object of type 'GetNormals-request"
  "sensor_stick/GetNormalsRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetNormals-request>)))
  "Returns md5sum for a message object of type '<GetNormals-request>"
  "0a9bb8a1d7550c14c769843382adf4ac")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetNormals-request)))
  "Returns md5sum for a message object of type 'GetNormals-request"
  "0a9bb8a1d7550c14c769843382adf4ac")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetNormals-request>)))
  "Returns full string definition for message of type '<GetNormals-request>"
  (cl:format cl:nil "sensor_msgs/PointCloud2 cluster~%~%================================================================================~%MSG: sensor_msgs/PointCloud2~%# This message holds a collection of N-dimensional points, which may~%# contain additional information such as normals, intensity, etc. The~%# point data is stored as a binary blob, its layout described by the~%# contents of the \"fields\" array.~%~%# The point cloud data may be organized 2d (image-like) or 1d~%# (unordered). Point clouds organized as 2d images may be produced by~%# camera depth sensors such as stereo or time-of-flight.~%~%# Time of sensor data acquisition, and the coordinate frame ID (for 3d~%# points).~%Header header~%~%# 2D structure of the point cloud. If the cloud is unordered, height is~%# 1 and width is the length of the point cloud.~%uint32 height~%uint32 width~%~%# Describes the channels and their layout in the binary data blob.~%PointField[] fields~%~%bool    is_bigendian # Is this data bigendian?~%uint32  point_step   # Length of a point in bytes~%uint32  row_step     # Length of a row in bytes~%uint8[] data         # Actual point data, size is (row_step*height)~%~%bool is_dense        # True if there are no invalid points~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: sensor_msgs/PointField~%# This message holds the description of one point entry in the~%# PointCloud2 message format.~%uint8 INT8    = 1~%uint8 UINT8   = 2~%uint8 INT16   = 3~%uint8 UINT16  = 4~%uint8 INT32   = 5~%uint8 UINT32  = 6~%uint8 FLOAT32 = 7~%uint8 FLOAT64 = 8~%~%string name      # Name of field~%uint32 offset    # Offset from start of point struct~%uint8  datatype  # Datatype enumeration, see above~%uint32 count     # How many elements in the field~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetNormals-request)))
  "Returns full string definition for message of type 'GetNormals-request"
  (cl:format cl:nil "sensor_msgs/PointCloud2 cluster~%~%================================================================================~%MSG: sensor_msgs/PointCloud2~%# This message holds a collection of N-dimensional points, which may~%# contain additional information such as normals, intensity, etc. The~%# point data is stored as a binary blob, its layout described by the~%# contents of the \"fields\" array.~%~%# The point cloud data may be organized 2d (image-like) or 1d~%# (unordered). Point clouds organized as 2d images may be produced by~%# camera depth sensors such as stereo or time-of-flight.~%~%# Time of sensor data acquisition, and the coordinate frame ID (for 3d~%# points).~%Header header~%~%# 2D structure of the point cloud. If the cloud is unordered, height is~%# 1 and width is the length of the point cloud.~%uint32 height~%uint32 width~%~%# Describes the channels and their layout in the binary data blob.~%PointField[] fields~%~%bool    is_bigendian # Is this data bigendian?~%uint32  point_step   # Length of a point in bytes~%uint32  row_step     # Length of a row in bytes~%uint8[] data         # Actual point data, size is (row_step*height)~%~%bool is_dense        # True if there are no invalid points~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: sensor_msgs/PointField~%# This message holds the description of one point entry in the~%# PointCloud2 message format.~%uint8 INT8    = 1~%uint8 UINT8   = 2~%uint8 INT16   = 3~%uint8 UINT16  = 4~%uint8 INT32   = 5~%uint8 UINT32  = 6~%uint8 FLOAT32 = 7~%uint8 FLOAT64 = 8~%~%string name      # Name of field~%uint32 offset    # Offset from start of point struct~%uint8  datatype  # Datatype enumeration, see above~%uint32 count     # How many elements in the field~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetNormals-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'cluster))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetNormals-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GetNormals-request
    (cl:cons ':cluster (cluster msg))
))
;//! \htmlinclude GetNormals-response.msg.html

(cl:defclass <GetNormals-response> (roslisp-msg-protocol:ros-message)
  ((cluster
    :reader cluster
    :initarg :cluster
    :type sensor_msgs-msg:PointCloud2
    :initform (cl:make-instance 'sensor_msgs-msg:PointCloud2)))
)

(cl:defclass GetNormals-response (<GetNormals-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetNormals-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetNormals-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sensor_stick-srv:<GetNormals-response> is deprecated: use sensor_stick-srv:GetNormals-response instead.")))

(cl:ensure-generic-function 'cluster-val :lambda-list '(m))
(cl:defmethod cluster-val ((m <GetNormals-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sensor_stick-srv:cluster-val is deprecated.  Use sensor_stick-srv:cluster instead.")
  (cluster m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetNormals-response>) ostream)
  "Serializes a message object of type '<GetNormals-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'cluster) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetNormals-response>) istream)
  "Deserializes a message object of type '<GetNormals-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'cluster) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetNormals-response>)))
  "Returns string type for a service object of type '<GetNormals-response>"
  "sensor_stick/GetNormalsResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetNormals-response)))
  "Returns string type for a service object of type 'GetNormals-response"
  "sensor_stick/GetNormalsResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetNormals-response>)))
  "Returns md5sum for a message object of type '<GetNormals-response>"
  "0a9bb8a1d7550c14c769843382adf4ac")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetNormals-response)))
  "Returns md5sum for a message object of type 'GetNormals-response"
  "0a9bb8a1d7550c14c769843382adf4ac")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetNormals-response>)))
  "Returns full string definition for message of type '<GetNormals-response>"
  (cl:format cl:nil "sensor_msgs/PointCloud2 cluster~%~%~%================================================================================~%MSG: sensor_msgs/PointCloud2~%# This message holds a collection of N-dimensional points, which may~%# contain additional information such as normals, intensity, etc. The~%# point data is stored as a binary blob, its layout described by the~%# contents of the \"fields\" array.~%~%# The point cloud data may be organized 2d (image-like) or 1d~%# (unordered). Point clouds organized as 2d images may be produced by~%# camera depth sensors such as stereo or time-of-flight.~%~%# Time of sensor data acquisition, and the coordinate frame ID (for 3d~%# points).~%Header header~%~%# 2D structure of the point cloud. If the cloud is unordered, height is~%# 1 and width is the length of the point cloud.~%uint32 height~%uint32 width~%~%# Describes the channels and their layout in the binary data blob.~%PointField[] fields~%~%bool    is_bigendian # Is this data bigendian?~%uint32  point_step   # Length of a point in bytes~%uint32  row_step     # Length of a row in bytes~%uint8[] data         # Actual point data, size is (row_step*height)~%~%bool is_dense        # True if there are no invalid points~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: sensor_msgs/PointField~%# This message holds the description of one point entry in the~%# PointCloud2 message format.~%uint8 INT8    = 1~%uint8 UINT8   = 2~%uint8 INT16   = 3~%uint8 UINT16  = 4~%uint8 INT32   = 5~%uint8 UINT32  = 6~%uint8 FLOAT32 = 7~%uint8 FLOAT64 = 8~%~%string name      # Name of field~%uint32 offset    # Offset from start of point struct~%uint8  datatype  # Datatype enumeration, see above~%uint32 count     # How many elements in the field~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetNormals-response)))
  "Returns full string definition for message of type 'GetNormals-response"
  (cl:format cl:nil "sensor_msgs/PointCloud2 cluster~%~%~%================================================================================~%MSG: sensor_msgs/PointCloud2~%# This message holds a collection of N-dimensional points, which may~%# contain additional information such as normals, intensity, etc. The~%# point data is stored as a binary blob, its layout described by the~%# contents of the \"fields\" array.~%~%# The point cloud data may be organized 2d (image-like) or 1d~%# (unordered). Point clouds organized as 2d images may be produced by~%# camera depth sensors such as stereo or time-of-flight.~%~%# Time of sensor data acquisition, and the coordinate frame ID (for 3d~%# points).~%Header header~%~%# 2D structure of the point cloud. If the cloud is unordered, height is~%# 1 and width is the length of the point cloud.~%uint32 height~%uint32 width~%~%# Describes the channels and their layout in the binary data blob.~%PointField[] fields~%~%bool    is_bigendian # Is this data bigendian?~%uint32  point_step   # Length of a point in bytes~%uint32  row_step     # Length of a row in bytes~%uint8[] data         # Actual point data, size is (row_step*height)~%~%bool is_dense        # True if there are no invalid points~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: sensor_msgs/PointField~%# This message holds the description of one point entry in the~%# PointCloud2 message format.~%uint8 INT8    = 1~%uint8 UINT8   = 2~%uint8 INT16   = 3~%uint8 UINT16  = 4~%uint8 INT32   = 5~%uint8 UINT32  = 6~%uint8 FLOAT32 = 7~%uint8 FLOAT64 = 8~%~%string name      # Name of field~%uint32 offset    # Offset from start of point struct~%uint8  datatype  # Datatype enumeration, see above~%uint32 count     # How many elements in the field~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetNormals-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'cluster))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetNormals-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GetNormals-response
    (cl:cons ':cluster (cluster msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GetNormals)))
  'GetNormals-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GetNormals)))
  'GetNormals-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetNormals)))
  "Returns string type for a service object of type '<GetNormals>"
  "sensor_stick/GetNormals")