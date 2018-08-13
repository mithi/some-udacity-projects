; Auto-generated. Do not edit!


(cl:in-package pr2_robot-srv)


;//! \htmlinclude PickPlace-request.msg.html

(cl:defclass <PickPlace-request> (roslisp-msg-protocol:ros-message)
  ((test_scene_num
    :reader test_scene_num
    :initarg :test_scene_num
    :type std_msgs-msg:Int32
    :initform (cl:make-instance 'std_msgs-msg:Int32))
   (object_name
    :reader object_name
    :initarg :object_name
    :type std_msgs-msg:String
    :initform (cl:make-instance 'std_msgs-msg:String))
   (arm_name
    :reader arm_name
    :initarg :arm_name
    :type std_msgs-msg:String
    :initform (cl:make-instance 'std_msgs-msg:String))
   (pick_pose
    :reader pick_pose
    :initarg :pick_pose
    :type geometry_msgs-msg:Pose
    :initform (cl:make-instance 'geometry_msgs-msg:Pose))
   (place_pose
    :reader place_pose
    :initarg :place_pose
    :type geometry_msgs-msg:Pose
    :initform (cl:make-instance 'geometry_msgs-msg:Pose)))
)

(cl:defclass PickPlace-request (<PickPlace-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PickPlace-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PickPlace-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pr2_robot-srv:<PickPlace-request> is deprecated: use pr2_robot-srv:PickPlace-request instead.")))

(cl:ensure-generic-function 'test_scene_num-val :lambda-list '(m))
(cl:defmethod test_scene_num-val ((m <PickPlace-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pr2_robot-srv:test_scene_num-val is deprecated.  Use pr2_robot-srv:test_scene_num instead.")
  (test_scene_num m))

(cl:ensure-generic-function 'object_name-val :lambda-list '(m))
(cl:defmethod object_name-val ((m <PickPlace-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pr2_robot-srv:object_name-val is deprecated.  Use pr2_robot-srv:object_name instead.")
  (object_name m))

(cl:ensure-generic-function 'arm_name-val :lambda-list '(m))
(cl:defmethod arm_name-val ((m <PickPlace-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pr2_robot-srv:arm_name-val is deprecated.  Use pr2_robot-srv:arm_name instead.")
  (arm_name m))

(cl:ensure-generic-function 'pick_pose-val :lambda-list '(m))
(cl:defmethod pick_pose-val ((m <PickPlace-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pr2_robot-srv:pick_pose-val is deprecated.  Use pr2_robot-srv:pick_pose instead.")
  (pick_pose m))

(cl:ensure-generic-function 'place_pose-val :lambda-list '(m))
(cl:defmethod place_pose-val ((m <PickPlace-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pr2_robot-srv:place_pose-val is deprecated.  Use pr2_robot-srv:place_pose instead.")
  (place_pose m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PickPlace-request>) ostream)
  "Serializes a message object of type '<PickPlace-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'test_scene_num) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'object_name) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'arm_name) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pick_pose) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'place_pose) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PickPlace-request>) istream)
  "Deserializes a message object of type '<PickPlace-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'test_scene_num) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'object_name) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'arm_name) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pick_pose) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'place_pose) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PickPlace-request>)))
  "Returns string type for a service object of type '<PickPlace-request>"
  "pr2_robot/PickPlaceRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PickPlace-request)))
  "Returns string type for a service object of type 'PickPlace-request"
  "pr2_robot/PickPlaceRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PickPlace-request>)))
  "Returns md5sum for a message object of type '<PickPlace-request>"
  "803571dc87b1116273df703ec8a12b59")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PickPlace-request)))
  "Returns md5sum for a message object of type 'PickPlace-request"
  "803571dc87b1116273df703ec8a12b59")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PickPlace-request>)))
  "Returns full string definition for message of type '<PickPlace-request>"
  (cl:format cl:nil "~%std_msgs/Int32 test_scene_num~%std_msgs/String object_name~%std_msgs/String arm_name~%geometry_msgs/Pose pick_pose~%geometry_msgs/Pose place_pose~%~%================================================================================~%MSG: std_msgs/Int32~%int32 data~%================================================================================~%MSG: std_msgs/String~%string data~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PickPlace-request)))
  "Returns full string definition for message of type 'PickPlace-request"
  (cl:format cl:nil "~%std_msgs/Int32 test_scene_num~%std_msgs/String object_name~%std_msgs/String arm_name~%geometry_msgs/Pose pick_pose~%geometry_msgs/Pose place_pose~%~%================================================================================~%MSG: std_msgs/Int32~%int32 data~%================================================================================~%MSG: std_msgs/String~%string data~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PickPlace-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'test_scene_num))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'object_name))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'arm_name))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pick_pose))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'place_pose))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PickPlace-request>))
  "Converts a ROS message object to a list"
  (cl:list 'PickPlace-request
    (cl:cons ':test_scene_num (test_scene_num msg))
    (cl:cons ':object_name (object_name msg))
    (cl:cons ':arm_name (arm_name msg))
    (cl:cons ':pick_pose (pick_pose msg))
    (cl:cons ':place_pose (place_pose msg))
))
;//! \htmlinclude PickPlace-response.msg.html

(cl:defclass <PickPlace-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass PickPlace-response (<PickPlace-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PickPlace-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PickPlace-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pr2_robot-srv:<PickPlace-response> is deprecated: use pr2_robot-srv:PickPlace-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <PickPlace-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pr2_robot-srv:success-val is deprecated.  Use pr2_robot-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PickPlace-response>) ostream)
  "Serializes a message object of type '<PickPlace-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PickPlace-response>) istream)
  "Deserializes a message object of type '<PickPlace-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PickPlace-response>)))
  "Returns string type for a service object of type '<PickPlace-response>"
  "pr2_robot/PickPlaceResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PickPlace-response)))
  "Returns string type for a service object of type 'PickPlace-response"
  "pr2_robot/PickPlaceResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PickPlace-response>)))
  "Returns md5sum for a message object of type '<PickPlace-response>"
  "803571dc87b1116273df703ec8a12b59")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PickPlace-response)))
  "Returns md5sum for a message object of type 'PickPlace-response"
  "803571dc87b1116273df703ec8a12b59")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PickPlace-response>)))
  "Returns full string definition for message of type '<PickPlace-response>"
  (cl:format cl:nil "~%bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PickPlace-response)))
  "Returns full string definition for message of type 'PickPlace-response"
  (cl:format cl:nil "~%bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PickPlace-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PickPlace-response>))
  "Converts a ROS message object to a list"
  (cl:list 'PickPlace-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'PickPlace)))
  'PickPlace-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'PickPlace)))
  'PickPlace-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PickPlace)))
  "Returns string type for a service object of type '<PickPlace>"
  "pr2_robot/PickPlace")