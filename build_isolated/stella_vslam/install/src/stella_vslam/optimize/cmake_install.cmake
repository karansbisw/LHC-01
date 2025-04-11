# Install script for directory: /home/karan/catkin_ws/src/openvslam/src/stella_vslam/optimize

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/karan/catkin_ws/install_isolated")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/stella_vslam/optimize" TYPE FILE FILES
    "/home/karan/catkin_ws/src/openvslam/src/stella_vslam/optimize/global_bundle_adjuster.h"
    "/home/karan/catkin_ws/src/openvslam/src/stella_vslam/optimize/graph_optimizer.h"
    "/home/karan/catkin_ws/src/openvslam/src/stella_vslam/optimize/local_bundle_adjuster.h"
    "/home/karan/catkin_ws/src/openvslam/src/stella_vslam/optimize/local_bundle_adjuster_factory.h"
    "/home/karan/catkin_ws/src/openvslam/src/stella_vslam/optimize/local_bundle_adjuster_g2o.h"
    "/home/karan/catkin_ws/src/openvslam/src/stella_vslam/optimize/local_bundle_adjuster_gtsam.h"
    "/home/karan/catkin_ws/src/openvslam/src/stella_vslam/optimize/pose_optimizer.h"
    "/home/karan/catkin_ws/src/openvslam/src/stella_vslam/optimize/pose_optimizer_factory.h"
    "/home/karan/catkin_ws/src/openvslam/src/stella_vslam/optimize/pose_optimizer_g2o.h"
    "/home/karan/catkin_ws/src/openvslam/src/stella_vslam/optimize/pose_optimizer_gtsam.h"
    "/home/karan/catkin_ws/src/openvslam/src/stella_vslam/optimize/terminate_action.h"
    "/home/karan/catkin_ws/src/openvslam/src/stella_vslam/optimize/transform_optimizer.h"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/karan/catkin_ws/build_isolated/stella_vslam/install/src/stella_vslam/optimize/internal/cmake_install.cmake")
  include("/home/karan/catkin_ws/build_isolated/stella_vslam/install/src/stella_vslam/optimize/internal_gtsam/cmake_install.cmake")

endif()

