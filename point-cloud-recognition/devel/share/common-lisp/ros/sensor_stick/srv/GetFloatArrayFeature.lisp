; Auto-generated. Do not edit!


(cl:in-package sensor_stick-srv)


;//! \htmlinclude GetFloatArrayFeature-request.msg.html

(cl:defclass <GetFloatArrayFeature-request> (roslisp-msg-protocol:ros-message)
  ((cluster
    :reader cluster
    :initarg :cluster
    :type sensor_msgs-msg:PointCloud2
    :initform (cl:make-instance 'sensor_msgs-msg:PointCloud2)))
)

(cl:defclass GetFloatArrayFeature-request (<GetFloatArrayFeature-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetFloatArrayFeature-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetFloatArrayFeature-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sensor_stick-srv:<GetFloatArrayFeature-request> is deprecated: use sensor_stick-srv:GetFloatArrayFeature-request instead.")))

(cl:ensure-generic-function 'cluster-val :lambda-list '(m))
(cl:defmethod cluster-val ((m <GetFloatArrayFeature-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sensor_stick-srv:cluster-val is deprecated.  Use sensor_stick-srv:cluster instead.")
  (cluster m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetFloatArrayFeature-request>) ostream)
  "Serializes a message object of type '<GetFloatArrayFeature-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'cluster) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetFloatArrayFeature-request>) istream)
  "Deserializes a message object of type '<GetFloatArrayFeature-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'cluster) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetFloatArrayFeature-request>)))
  "Returns string type for a service object of type '<GetFloatArrayFeature-request>"
  "sensor_stick/GetFloatArrayFeatureRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetFloatArrayFeature-request)))
  "Returns string type for a service object of type 'GetFloatArrayFeature-request"
  "sensor_stick/GetFloatArrayFeatureRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetFloatArrayFeature-request>)))
  "Returns md5sum for a message object of type '<GetFloatArrayFeature-request>"
  "c90ae3a91de76e55487209150231b931")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetFloatArrayFeature-request)))
  "Returns md5sum for a message object of type 'GetFloatArrayFeature-request"
  "c90ae3a91de76e55487209150231b931")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetFloatArrayFeature-request>)))
  "Returns full string definition for message of type '<GetFloatArrayFeature-request>"
  (cl:format cl:nil "sensor_msgs/PointCloud2 cluster~%~%================================================================================~%MSG: sensor_msgs/PointCloud2~%# This message holds a collection of N-dimensional points, which may~%# contain additional information such as normals, intensity, etc. The~%# point data is stored as a binary blob, its layout described by the~%# contents of the \"fields\" array.~%~%# The point cloud data may be organized 2d (image-like) or 1d~%# (unordered). Point clouds organized as 2d images may be produced by~%# camera depth sensors such as stereo or time-of-flight.~%~%# Time of sensor data acquisition, and the coordinate frame ID (for 3d~%# points).~%Header header~%~%# 2D structure of the point cloud. If the cloud is unordered, height is~%# 1 and width is the length of the point cloud.~%uint32 height~%uint32 width~%~%# Describes the channels and their layout in the binary data blob.~%PointField[] fields~%~%bool    is_bigendian # Is this data bigendian?~%uint32  point_step   # Length of a point in bytes~%uint32  row_step     # Length of a row in bytes~%uint8[] data         # Actual point data, size is (row_step*height)~%~%bool is_dense        # True if there are no invalid points~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: sensor_msgs/PointField~%# This message holds the description of one point entry in the~%# PointCloud2 message format.~%uint8 INT8    = 1~%uint8 UINT8   = 2~%uint8 INT16   = 3~%uint8 UINT16  = 4~%uint8 INT32   = 5~%uint8 UINT32  = 6~%uint8 FLOAT32 = 7~%uint8 FLOAT64 = 8~%~%string name      # Name of field~%uint32 offset    # Offset from start of point struct~%uint8  datatype  # Datatype enumeration, see above~%uint32 count     # How many elements in the field~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetFloatArrayFeature-request)))
  "Returns full string definition for message of type 'GetFloatArrayFeature-request"
  (cl:format cl:nil "sensor_msgs/PointCloud2 cluster~%~%================================================================================~%MSG: sensor_msgs/PointCloud2~%# This message holds a collection of N-dimensional points, which may~%# contain additional information such as normals, intensity, etc. The~%# point data is stored as a binary blob, its layout described by the~%# contents of the \"fields\" array.~%~%# The point cloud data may be organized 2d (image-like) or 1d~%# (unordered). Point clouds organized as 2d images may be produced by~%# camera depth sensors such as stereo or time-of-flight.~%~%# Time of sensor data acquisition, and the coordinate frame ID (for 3d~%# points).~%Header header~%~%# 2D structure of the point cloud. If the cloud is unordered, height is~%# 1 and width is the length of the point cloud.~%uint32 height~%uint32 width~%~%# Describes the channels and their layout in the binary data blob.~%PointField[] fields~%~%bool    is_bigendian # Is this data bigendian?~%uint32  point_step   # Length of a point in bytes~%uint32  row_step     # Length of a row in bytes~%uint8[] data         # Actual point data, size is (row_step*height)~%~%bool is_dense        # True if there are no invalid points~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: sensor_msgs/PointField~%# This message holds the description of one point entry in the~%# PointCloud2 message format.~%uint8 INT8    = 1~%uint8 UINT8   = 2~%uint8 INT16   = 3~%uint8 UINT16  = 4~%uint8 INT32   = 5~%uint8 UINT32  = 6~%uint8 FLOAT32 = 7~%uint8 FLOAT64 = 8~%~%string name      # Name of field~%uint32 offset    # Offset from start of point struct~%uint8  datatype  # Datatype enumeration, see above~%uint32 count     # How many elements in the field~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetFloatArrayFeature-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'cluster))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetFloatArrayFeature-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GetFloatArrayFeature-request
    (cl:cons ':cluster (cluster msg))
))
;//! \htmlinclude GetFloatArrayFeature-response.msg.html

(cl:defclass <GetFloatArrayFeature-response> (roslisp-msg-protocol:ros-message)
  ((feature
    :reader feature
    :initarg :feature
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass GetFloatArrayFeature-response (<GetFloatArrayFeature-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetFloatArrayFeature-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetFloatArrayFeature-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sensor_stick-srv:<GetFloatArrayFeature-response> is deprecated: use sensor_stick-srv:GetFloatArrayFeature-response instead.")))

(cl:ensure-generic-function 'feature-val :lambda-list '(m))
(cl:defmethod feature-val ((m <GetFloatArrayFeature-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sensor_stick-srv:feature-val is deprecated.  Use sensor_stick-srv:feature instead.")
  (feature m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetFloatArrayFeature-response>) ostream)
  "Serializes a message object of type '<GetFloatArrayFeature-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'feature))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'feature))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetFloatArrayFeature-response>) istream)
  "Deserializes a message object of type '<GetFloatArrayFeature-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'feature) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'feature)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetFloatArrayFeature-response>)))
  "Returns string type for a service object of type '<GetFloatArrayFeature-response>"
  "sensor_stick/GetFloatArrayFeatureResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetFloatArrayFeature-response)))
  "Returns string type for a service object of type 'GetFloatArrayFeature-response"
  "sensor_stick/GetFloatArrayFeatureResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetFloatArrayFeature-response>)))
  "Returns md5sum for a message object of type '<GetFloatArrayFeature-response>"
  "c90ae3a91de76e55487209150231b931")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetFloatArrayFeature-response)))
  "Returns md5sum for a message object of type 'GetFloatArrayFeature-response"
  "c90ae3a91de76e55487209150231b931")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetFloatArrayFeature-response>)))
  "Returns full string definition for message of type '<GetFloatArrayFeature-response>"
  (cl:format cl:nil "float32[] feature~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetFloatArrayFeature-response)))
  "Returns full string definition for message of type 'GetFloatArrayFeature-response"
  (cl:format cl:nil "float32[] feature~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetFloatArrayFeature-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'feature) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetFloatArrayFeature-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GetFloatArrayFeature-response
    (cl:cons ':feature (feature msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GetFloatArrayFeature)))
  'GetFloatArrayFeature-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GetFloatArrayFeature)))
  'GetFloatArrayFeature-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetFloatArrayFeature)))
  "Returns string type for a service object of type '<GetFloatArrayFeature>"
  "sensor_stick/GetFloatArrayFeature")