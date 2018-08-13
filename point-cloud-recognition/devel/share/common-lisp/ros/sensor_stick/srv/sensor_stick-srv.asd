
(cl:in-package :asdf)

(defsystem "sensor_stick-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :sensor_msgs-msg
)
  :components ((:file "_package")
    (:file "GetFloatArrayFeature" :depends-on ("_package_GetFloatArrayFeature"))
    (:file "_package_GetFloatArrayFeature" :depends-on ("_package"))
    (:file "GetNormals" :depends-on ("_package_GetNormals"))
    (:file "_package_GetNormals" :depends-on ("_package"))
  ))