;; Auto-generated. Do not edit!


(when (boundp 'pr2_robot::PickPlace)
  (if (not (find-package "PR2_ROBOT"))
    (make-package "PR2_ROBOT"))
  (shadow 'PickPlace (find-package "PR2_ROBOT")))
(unless (find-package "PR2_ROBOT::PICKPLACE")
  (make-package "PR2_ROBOT::PICKPLACE"))
(unless (find-package "PR2_ROBOT::PICKPLACEREQUEST")
  (make-package "PR2_ROBOT::PICKPLACEREQUEST"))
(unless (find-package "PR2_ROBOT::PICKPLACERESPONSE")
  (make-package "PR2_ROBOT::PICKPLACERESPONSE"))

(in-package "ROS")

(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))




(defclass pr2_robot::PickPlaceRequest
  :super ros::object
  :slots (_test_scene_num _object_name _arm_name _pick_pose _place_pose ))

(defmethod pr2_robot::PickPlaceRequest
  (:init
   (&key
    ((:test_scene_num __test_scene_num) (instance std_msgs::Int32 :init))
    ((:object_name __object_name) (instance std_msgs::String :init))
    ((:arm_name __arm_name) (instance std_msgs::String :init))
    ((:pick_pose __pick_pose) (instance geometry_msgs::Pose :init))
    ((:place_pose __place_pose) (instance geometry_msgs::Pose :init))
    )
   (send-super :init)
   (setq _test_scene_num __test_scene_num)
   (setq _object_name __object_name)
   (setq _arm_name __arm_name)
   (setq _pick_pose __pick_pose)
   (setq _place_pose __place_pose)
   self)
  (:test_scene_num
   (&rest __test_scene_num)
   (if (keywordp (car __test_scene_num))
       (send* _test_scene_num __test_scene_num)
     (progn
       (if __test_scene_num (setq _test_scene_num (car __test_scene_num)))
       _test_scene_num)))
  (:object_name
   (&rest __object_name)
   (if (keywordp (car __object_name))
       (send* _object_name __object_name)
     (progn
       (if __object_name (setq _object_name (car __object_name)))
       _object_name)))
  (:arm_name
   (&rest __arm_name)
   (if (keywordp (car __arm_name))
       (send* _arm_name __arm_name)
     (progn
       (if __arm_name (setq _arm_name (car __arm_name)))
       _arm_name)))
  (:pick_pose
   (&rest __pick_pose)
   (if (keywordp (car __pick_pose))
       (send* _pick_pose __pick_pose)
     (progn
       (if __pick_pose (setq _pick_pose (car __pick_pose)))
       _pick_pose)))
  (:place_pose
   (&rest __place_pose)
   (if (keywordp (car __place_pose))
       (send* _place_pose __place_pose)
     (progn
       (if __place_pose (setq _place_pose (car __place_pose)))
       _place_pose)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Int32 _test_scene_num
    (send _test_scene_num :serialization-length)
    ;; std_msgs/String _object_name
    (send _object_name :serialization-length)
    ;; std_msgs/String _arm_name
    (send _arm_name :serialization-length)
    ;; geometry_msgs/Pose _pick_pose
    (send _pick_pose :serialization-length)
    ;; geometry_msgs/Pose _place_pose
    (send _place_pose :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Int32 _test_scene_num
       (send _test_scene_num :serialize s)
     ;; std_msgs/String _object_name
       (send _object_name :serialize s)
     ;; std_msgs/String _arm_name
       (send _arm_name :serialize s)
     ;; geometry_msgs/Pose _pick_pose
       (send _pick_pose :serialize s)
     ;; geometry_msgs/Pose _place_pose
       (send _place_pose :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Int32 _test_scene_num
     (send _test_scene_num :deserialize buf ptr-) (incf ptr- (send _test_scene_num :serialization-length))
   ;; std_msgs/String _object_name
     (send _object_name :deserialize buf ptr-) (incf ptr- (send _object_name :serialization-length))
   ;; std_msgs/String _arm_name
     (send _arm_name :deserialize buf ptr-) (incf ptr- (send _arm_name :serialization-length))
   ;; geometry_msgs/Pose _pick_pose
     (send _pick_pose :deserialize buf ptr-) (incf ptr- (send _pick_pose :serialization-length))
   ;; geometry_msgs/Pose _place_pose
     (send _place_pose :deserialize buf ptr-) (incf ptr- (send _place_pose :serialization-length))
   ;;
   self)
  )

(defclass pr2_robot::PickPlaceResponse
  :super ros::object
  :slots (_success ))

(defmethod pr2_robot::PickPlaceResponse
  (:init
   (&key
    ((:success __success) nil)
    )
   (send-super :init)
   (setq _success __success)
   self)
  (:success
   (&optional __success)
   (if __success (setq _success __success)) _success)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass pr2_robot::PickPlace
  :super ros::object
  :slots ())

(setf (get pr2_robot::PickPlace :md5sum-) "803571dc87b1116273df703ec8a12b59")
(setf (get pr2_robot::PickPlace :datatype-) "pr2_robot/PickPlace")
(setf (get pr2_robot::PickPlace :request) pr2_robot::PickPlaceRequest)
(setf (get pr2_robot::PickPlace :response) pr2_robot::PickPlaceResponse)

(defmethod pr2_robot::PickPlaceRequest
  (:response () (instance pr2_robot::PickPlaceResponse :init)))

(setf (get pr2_robot::PickPlaceRequest :md5sum-) "803571dc87b1116273df703ec8a12b59")
(setf (get pr2_robot::PickPlaceRequest :datatype-) "pr2_robot/PickPlaceRequest")
(setf (get pr2_robot::PickPlaceRequest :definition-)
      "
std_msgs/Int32 test_scene_num
std_msgs/String object_name
std_msgs/String arm_name
geometry_msgs/Pose pick_pose
geometry_msgs/Pose place_pose

================================================================================
MSG: std_msgs/Int32
int32 data
================================================================================
MSG: std_msgs/String
string data

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
---

bool success

")

(setf (get pr2_robot::PickPlaceResponse :md5sum-) "803571dc87b1116273df703ec8a12b59")
(setf (get pr2_robot::PickPlaceResponse :datatype-) "pr2_robot/PickPlaceResponse")
(setf (get pr2_robot::PickPlaceResponse :definition-)
      "
std_msgs/Int32 test_scene_num
std_msgs/String object_name
std_msgs/String arm_name
geometry_msgs/Pose pick_pose
geometry_msgs/Pose place_pose

================================================================================
MSG: std_msgs/Int32
int32 data
================================================================================
MSG: std_msgs/String
string data

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
---

bool success

")



(provide :pr2_robot/PickPlace "803571dc87b1116273df703ec8a12b59")


