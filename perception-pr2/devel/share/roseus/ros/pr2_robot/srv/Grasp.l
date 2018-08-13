;; Auto-generated. Do not edit!


(when (boundp 'pr2_robot::Grasp)
  (if (not (find-package "PR2_ROBOT"))
    (make-package "PR2_ROBOT"))
  (shadow 'Grasp (find-package "PR2_ROBOT")))
(unless (find-package "PR2_ROBOT::GRASP")
  (make-package "PR2_ROBOT::GRASP"))
(unless (find-package "PR2_ROBOT::GRASPREQUEST")
  (make-package "PR2_ROBOT::GRASPREQUEST"))
(unless (find-package "PR2_ROBOT::GRASPRESPONSE")
  (make-package "PR2_ROBOT::GRASPRESPONSE"))

(in-package "ROS")

(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass pr2_robot::GraspRequest
  :super ros::object
  :slots (_object_name _test_scene_num ))

(defmethod pr2_robot::GraspRequest
  (:init
   (&key
    ((:object_name __object_name) (instance std_msgs::String :init))
    ((:test_scene_num __test_scene_num) (instance std_msgs::Int32 :init))
    )
   (send-super :init)
   (setq _object_name __object_name)
   (setq _test_scene_num __test_scene_num)
   self)
  (:object_name
   (&rest __object_name)
   (if (keywordp (car __object_name))
       (send* _object_name __object_name)
     (progn
       (if __object_name (setq _object_name (car __object_name)))
       _object_name)))
  (:test_scene_num
   (&rest __test_scene_num)
   (if (keywordp (car __test_scene_num))
       (send* _test_scene_num __test_scene_num)
     (progn
       (if __test_scene_num (setq _test_scene_num (car __test_scene_num)))
       _test_scene_num)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/String _object_name
    (send _object_name :serialization-length)
    ;; std_msgs/Int32 _test_scene_num
    (send _test_scene_num :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/String _object_name
       (send _object_name :serialize s)
     ;; std_msgs/Int32 _test_scene_num
       (send _test_scene_num :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/String _object_name
     (send _object_name :deserialize buf ptr-) (incf ptr- (send _object_name :serialization-length))
   ;; std_msgs/Int32 _test_scene_num
     (send _test_scene_num :deserialize buf ptr-) (incf ptr- (send _test_scene_num :serialization-length))
   ;;
   self)
  )

(defclass pr2_robot::GraspResponse
  :super ros::object
  :slots (_grasp_pose ))

(defmethod pr2_robot::GraspResponse
  (:init
   (&key
    ((:grasp_pose __grasp_pose) (instance geometry_msgs::Pose :init))
    )
   (send-super :init)
   (setq _grasp_pose __grasp_pose)
   self)
  (:grasp_pose
   (&rest __grasp_pose)
   (if (keywordp (car __grasp_pose))
       (send* _grasp_pose __grasp_pose)
     (progn
       (if __grasp_pose (setq _grasp_pose (car __grasp_pose)))
       _grasp_pose)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Pose _grasp_pose
    (send _grasp_pose :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Pose _grasp_pose
       (send _grasp_pose :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Pose _grasp_pose
     (send _grasp_pose :deserialize buf ptr-) (incf ptr- (send _grasp_pose :serialization-length))
   ;;
   self)
  )

(defclass pr2_robot::Grasp
  :super ros::object
  :slots ())

(setf (get pr2_robot::Grasp :md5sum-) "982194e190e8ba0c9866716771b038e9")
(setf (get pr2_robot::Grasp :datatype-) "pr2_robot/Grasp")
(setf (get pr2_robot::Grasp :request) pr2_robot::GraspRequest)
(setf (get pr2_robot::Grasp :response) pr2_robot::GraspResponse)

(defmethod pr2_robot::GraspRequest
  (:response () (instance pr2_robot::GraspResponse :init)))

(setf (get pr2_robot::GraspRequest :md5sum-) "982194e190e8ba0c9866716771b038e9")
(setf (get pr2_robot::GraspRequest :datatype-) "pr2_robot/GraspRequest")
(setf (get pr2_robot::GraspRequest :definition-)
      "
std_msgs/String object_name
std_msgs/Int32 test_scene_num

================================================================================
MSG: std_msgs/String
string data

================================================================================
MSG: std_msgs/Int32
---

geometry_msgs/Pose grasp_pose


================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w
")

(setf (get pr2_robot::GraspResponse :md5sum-) "982194e190e8ba0c9866716771b038e9")
(setf (get pr2_robot::GraspResponse :datatype-) "pr2_robot/GraspResponse")
(setf (get pr2_robot::GraspResponse :definition-)
      "
std_msgs/String object_name
std_msgs/Int32 test_scene_num

================================================================================
MSG: std_msgs/String
string data

================================================================================
MSG: std_msgs/Int32
---

geometry_msgs/Pose grasp_pose


================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w
")



(provide :pr2_robot/Grasp "982194e190e8ba0c9866716771b038e9")


