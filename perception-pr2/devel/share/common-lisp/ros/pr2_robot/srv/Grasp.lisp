; Auto-generated. Do not edit!


(cl:in-package pr2_robot-srv)


;//! \htmlinclude Grasp-request.msg.html

(cl:defclass <Grasp-request> (roslisp-msg-protocol:ros-message)
  ((object_name
    :reader object_name
    :initarg :object_name
    :type std_msgs-msg:String
    :initform (cl:make-instance 'std_msgs-msg:String))
   (test_scene_num
    :reader test_scene_num
    :initarg :test_scene_num
    :type std_msgs-msg:Int32
    :initform (cl:make-instance 'std_msgs-msg:Int32)))
)

(cl:defclass Grasp-request (<Grasp-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Grasp-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Grasp-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pr2_robot-srv:<Grasp-request> is deprecated: use pr2_robot-srv:Grasp-request instead.")))

(cl:ensure-generic-function 'object_name-val :lambda-list '(m))
(cl:defmethod object_name-val ((m <Grasp-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pr2_robot-srv:object_name-val is deprecated.  Use pr2_robot-srv:object_name instead.")
  (object_name m))

(cl:ensure-generic-function 'test_scene_num-val :lambda-list '(m))
(cl:defmethod test_scene_num-val ((m <Grasp-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pr2_robot-srv:test_scene_num-val is deprecated.  Use pr2_robot-srv:test_scene_num instead.")
  (test_scene_num m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Grasp-request>) ostream)
  "Serializes a message object of type '<Grasp-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'object_name) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'test_scene_num) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Grasp-request>) istream)
  "Deserializes a message object of type '<Grasp-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'object_name) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'test_scene_num) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Grasp-request>)))
  "Returns string type for a service object of type '<Grasp-request>"
  "pr2_robot/GraspRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Grasp-request)))
  "Returns string type for a service object of type 'Grasp-request"
  "pr2_robot/GraspRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Grasp-request>)))
  "Returns md5sum for a message object of type '<Grasp-request>"
  "982194e190e8ba0c9866716771b038e9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Grasp-request)))
  "Returns md5sum for a message object of type 'Grasp-request"
  "982194e190e8ba0c9866716771b038e9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Grasp-request>)))
  "Returns full string definition for message of type '<Grasp-request>"
  (cl:format cl:nil "~%std_msgs/String object_name~%std_msgs/Int32 test_scene_num~%~%================================================================================~%MSG: std_msgs/String~%string data~%~%================================================================================~%MSG: std_msgs/Int32~%int32 data~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Grasp-request)))
  "Returns full string definition for message of type 'Grasp-request"
  (cl:format cl:nil "~%std_msgs/String object_name~%std_msgs/Int32 test_scene_num~%~%================================================================================~%MSG: std_msgs/String~%string data~%~%================================================================================~%MSG: std_msgs/Int32~%int32 data~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Grasp-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'object_name))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'test_scene_num))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Grasp-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Grasp-request
    (cl:cons ':object_name (object_name msg))
    (cl:cons ':test_scene_num (test_scene_num msg))
))
;//! \htmlinclude Grasp-response.msg.html

(cl:defclass <Grasp-response> (roslisp-msg-protocol:ros-message)
  ((grasp_pose
    :reader grasp_pose
    :initarg :grasp_pose
    :type geometry_msgs-msg:Pose
    :initform (cl:make-instance 'geometry_msgs-msg:Pose)))
)

(cl:defclass Grasp-response (<Grasp-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Grasp-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Grasp-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pr2_robot-srv:<Grasp-response> is deprecated: use pr2_robot-srv:Grasp-response instead.")))

(cl:ensure-generic-function 'grasp_pose-val :lambda-list '(m))
(cl:defmethod grasp_pose-val ((m <Grasp-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pr2_robot-srv:grasp_pose-val is deprecated.  Use pr2_robot-srv:grasp_pose instead.")
  (grasp_pose m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Grasp-response>) ostream)
  "Serializes a message object of type '<Grasp-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'grasp_pose) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Grasp-response>) istream)
  "Deserializes a message object of type '<Grasp-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'grasp_pose) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Grasp-response>)))
  "Returns string type for a service object of type '<Grasp-response>"
  "pr2_robot/GraspResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Grasp-response)))
  "Returns string type for a service object of type 'Grasp-response"
  "pr2_robot/GraspResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Grasp-response>)))
  "Returns md5sum for a message object of type '<Grasp-response>"
  "982194e190e8ba0c9866716771b038e9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Grasp-response)))
  "Returns md5sum for a message object of type 'Grasp-response"
  "982194e190e8ba0c9866716771b038e9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Grasp-response>)))
  "Returns full string definition for message of type '<Grasp-response>"
  (cl:format cl:nil "~%geometry_msgs/Pose grasp_pose~%~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Grasp-response)))
  "Returns full string definition for message of type 'Grasp-response"
  (cl:format cl:nil "~%geometry_msgs/Pose grasp_pose~%~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Grasp-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'grasp_pose))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Grasp-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Grasp-response
    (cl:cons ':grasp_pose (grasp_pose msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Grasp)))
  'Grasp-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Grasp)))
  'Grasp-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Grasp)))
  "Returns string type for a service object of type '<Grasp>"
  "pr2_robot/Grasp")