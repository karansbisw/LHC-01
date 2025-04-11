# Install script for directory: /home/karan/catkin_ws/src/openvslam/src/stella_vslam/data

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/stella_vslam/data" TYPE FILE FILES
    "/home/karan/catkin_ws/src/openvslam/src/stella_vslam/data/bow_database.h"
    "/home/karan/catkin_ws/src/openvslam/src/stella_vslam/data/bow_vocabulary.h"
    "/home/karan/catkin_ws/src/openvslam/src/stella_vslam/data/bow_vocabulary_fwd.h"
    "/home/karan/catkin_ws/src/openvslam/src/stella_vslam/data/camera_database.h"
    "/home/karan/catkin_ws/src/openvslam/src/stella_vslam/data/common.h"
    "/home/karan/catkin_ws/src/openvslam/src/stella_vslam/data/frame.h"
    "/home/karan/catkin_ws/src/openvslam/src/stella_vslam/data/frame_observation.h"
    "/home/karan/catkin_ws/src/openvslam/src/stella_vslam/data/frame_statistics.h"
    "/home/karan/catkin_ws/src/openvslam/src/stella_vslam/data/graph_node.h"
    "/home/karan/catkin_ws/src/openvslam/src/stella_vslam/data/keyframe.h"
    "/home/karan/catkin_ws/src/openvslam/src/stella_vslam/data/landmark.h"
    "/home/karan/catkin_ws/src/openvslam/src/stella_vslam/data/map_database.h"
    "/home/karan/catkin_ws/src/openvslam/src/stella_vslam/data/marker.h"
    "/home/karan/catkin_ws/src/openvslam/src/stella_vslam/data/marker2d.h"
    "/home/karan/catkin_ws/src/openvslam/src/stella_vslam/data/orb_params_database.h"
    )
endif()

