execute_process(COMMAND "/home/mithi/catkin_ws/build/sensor_stick/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/mithi/catkin_ws/build/sensor_stick/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
