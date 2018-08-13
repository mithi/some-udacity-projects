# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "pr2_robot: 0 messages, 2 services")

set(MSG_I_FLAGS "-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/kinetic/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(pr2_robot_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/mithi/catkin_ws/src/RoboND-Perception-Project/pr2_robot/srv/Grasp.srv" NAME_WE)
add_custom_target(_pr2_robot_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "pr2_robot" "/home/mithi/catkin_ws/src/RoboND-Perception-Project/pr2_robot/srv/Grasp.srv" "geometry_msgs/Point:geometry_msgs/Quaternion:geometry_msgs/Pose:std_msgs/String:std_msgs/Int32"
)

get_filename_component(_filename "/home/mithi/catkin_ws/src/RoboND-Perception-Project/pr2_robot/srv/PickPlace.srv" NAME_WE)
add_custom_target(_pr2_robot_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "pr2_robot" "/home/mithi/catkin_ws/src/RoboND-Perception-Project/pr2_robot/srv/PickPlace.srv" "geometry_msgs/Point:geometry_msgs/Quaternion:geometry_msgs/Pose:std_msgs/String:std_msgs/Int32"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services
_generate_srv_cpp(pr2_robot
  "/home/mithi/catkin_ws/src/RoboND-Perception-Project/pr2_robot/srv/Grasp.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/String.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Int32.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pr2_robot
)
_generate_srv_cpp(pr2_robot
  "/home/mithi/catkin_ws/src/RoboND-Perception-Project/pr2_robot/srv/PickPlace.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/String.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Int32.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pr2_robot
)

### Generating Module File
_generate_module_cpp(pr2_robot
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pr2_robot
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(pr2_robot_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(pr2_robot_generate_messages pr2_robot_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/mithi/catkin_ws/src/RoboND-Perception-Project/pr2_robot/srv/Grasp.srv" NAME_WE)
add_dependencies(pr2_robot_generate_messages_cpp _pr2_robot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mithi/catkin_ws/src/RoboND-Perception-Project/pr2_robot/srv/PickPlace.srv" NAME_WE)
add_dependencies(pr2_robot_generate_messages_cpp _pr2_robot_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(pr2_robot_gencpp)
add_dependencies(pr2_robot_gencpp pr2_robot_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS pr2_robot_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages

### Generating Services
_generate_srv_eus(pr2_robot
  "/home/mithi/catkin_ws/src/RoboND-Perception-Project/pr2_robot/srv/Grasp.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/String.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Int32.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pr2_robot
)
_generate_srv_eus(pr2_robot
  "/home/mithi/catkin_ws/src/RoboND-Perception-Project/pr2_robot/srv/PickPlace.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/String.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Int32.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pr2_robot
)

### Generating Module File
_generate_module_eus(pr2_robot
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pr2_robot
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(pr2_robot_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(pr2_robot_generate_messages pr2_robot_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/mithi/catkin_ws/src/RoboND-Perception-Project/pr2_robot/srv/Grasp.srv" NAME_WE)
add_dependencies(pr2_robot_generate_messages_eus _pr2_robot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mithi/catkin_ws/src/RoboND-Perception-Project/pr2_robot/srv/PickPlace.srv" NAME_WE)
add_dependencies(pr2_robot_generate_messages_eus _pr2_robot_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(pr2_robot_geneus)
add_dependencies(pr2_robot_geneus pr2_robot_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS pr2_robot_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services
_generate_srv_lisp(pr2_robot
  "/home/mithi/catkin_ws/src/RoboND-Perception-Project/pr2_robot/srv/Grasp.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/String.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Int32.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pr2_robot
)
_generate_srv_lisp(pr2_robot
  "/home/mithi/catkin_ws/src/RoboND-Perception-Project/pr2_robot/srv/PickPlace.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/String.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Int32.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pr2_robot
)

### Generating Module File
_generate_module_lisp(pr2_robot
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pr2_robot
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(pr2_robot_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(pr2_robot_generate_messages pr2_robot_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/mithi/catkin_ws/src/RoboND-Perception-Project/pr2_robot/srv/Grasp.srv" NAME_WE)
add_dependencies(pr2_robot_generate_messages_lisp _pr2_robot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mithi/catkin_ws/src/RoboND-Perception-Project/pr2_robot/srv/PickPlace.srv" NAME_WE)
add_dependencies(pr2_robot_generate_messages_lisp _pr2_robot_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(pr2_robot_genlisp)
add_dependencies(pr2_robot_genlisp pr2_robot_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS pr2_robot_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages

### Generating Services
_generate_srv_nodejs(pr2_robot
  "/home/mithi/catkin_ws/src/RoboND-Perception-Project/pr2_robot/srv/Grasp.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/String.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Int32.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pr2_robot
)
_generate_srv_nodejs(pr2_robot
  "/home/mithi/catkin_ws/src/RoboND-Perception-Project/pr2_robot/srv/PickPlace.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/String.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Int32.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pr2_robot
)

### Generating Module File
_generate_module_nodejs(pr2_robot
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pr2_robot
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(pr2_robot_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(pr2_robot_generate_messages pr2_robot_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/mithi/catkin_ws/src/RoboND-Perception-Project/pr2_robot/srv/Grasp.srv" NAME_WE)
add_dependencies(pr2_robot_generate_messages_nodejs _pr2_robot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mithi/catkin_ws/src/RoboND-Perception-Project/pr2_robot/srv/PickPlace.srv" NAME_WE)
add_dependencies(pr2_robot_generate_messages_nodejs _pr2_robot_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(pr2_robot_gennodejs)
add_dependencies(pr2_robot_gennodejs pr2_robot_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS pr2_robot_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages

### Generating Services
_generate_srv_py(pr2_robot
  "/home/mithi/catkin_ws/src/RoboND-Perception-Project/pr2_robot/srv/Grasp.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/String.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Int32.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pr2_robot
)
_generate_srv_py(pr2_robot
  "/home/mithi/catkin_ws/src/RoboND-Perception-Project/pr2_robot/srv/PickPlace.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/String.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Int32.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pr2_robot
)

### Generating Module File
_generate_module_py(pr2_robot
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pr2_robot
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(pr2_robot_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(pr2_robot_generate_messages pr2_robot_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/mithi/catkin_ws/src/RoboND-Perception-Project/pr2_robot/srv/Grasp.srv" NAME_WE)
add_dependencies(pr2_robot_generate_messages_py _pr2_robot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mithi/catkin_ws/src/RoboND-Perception-Project/pr2_robot/srv/PickPlace.srv" NAME_WE)
add_dependencies(pr2_robot_generate_messages_py _pr2_robot_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(pr2_robot_genpy)
add_dependencies(pr2_robot_genpy pr2_robot_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS pr2_robot_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pr2_robot)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pr2_robot
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(pr2_robot_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(pr2_robot_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pr2_robot)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pr2_robot
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(pr2_robot_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(pr2_robot_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pr2_robot)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pr2_robot
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(pr2_robot_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(pr2_robot_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pr2_robot)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pr2_robot
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(pr2_robot_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(pr2_robot_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pr2_robot)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pr2_robot\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pr2_robot
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(pr2_robot_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(pr2_robot_generate_messages_py geometry_msgs_generate_messages_py)
endif()
