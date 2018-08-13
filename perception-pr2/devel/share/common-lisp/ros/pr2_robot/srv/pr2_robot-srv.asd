
(cl:in-package :asdf)

(defsystem "pr2_robot-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "Grasp" :depends-on ("_package_Grasp"))
    (:file "_package_Grasp" :depends-on ("_package"))
    (:file "PickPlace" :depends-on ("_package_PickPlace"))
    (:file "_package_PickPlace" :depends-on ("_package"))
  ))