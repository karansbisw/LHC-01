# CMake generated Testfile for 
# Source directory: /home/karan/catkin_ws/src/ddynamic_reconfigure
# Build directory: /home/karan/catkin_ws/build_isolated/ddynamic_reconfigure
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(_ctest_ddynamic_reconfigure_rostest_test_ddynamic_reconfigure.test "/home/karan/catkin_ws/build_isolated/ddynamic_reconfigure/catkin_generated/env_cached.sh" "/usr/bin/python2" "/opt/ros/melodic/share/catkin/cmake/test/run_tests.py" "/home/karan/catkin_ws/build_isolated/ddynamic_reconfigure/test_results/ddynamic_reconfigure/rostest-test_ddynamic_reconfigure.xml" "--return-code" "/usr/bin/python2 /opt/ros/melodic/share/rostest/cmake/../../../bin/rostest --pkgdir=/home/karan/catkin_ws/src/ddynamic_reconfigure --package=ddynamic_reconfigure --results-filename test_ddynamic_reconfigure.xml --results-base-dir \"/home/karan/catkin_ws/build_isolated/ddynamic_reconfigure/test_results\" /home/karan/catkin_ws/src/ddynamic_reconfigure/test/ddynamic_reconfigure.test ")
set_tests_properties(_ctest_ddynamic_reconfigure_rostest_test_ddynamic_reconfigure.test PROPERTIES  _BACKTRACE_TRIPLES "/opt/ros/melodic/share/catkin/cmake/test/tests.cmake;160;add_test;/opt/ros/melodic/share/rostest/cmake/rostest-extras.cmake;52;catkin_run_tests_target;/opt/ros/melodic/share/rostest/cmake/rostest-extras.cmake;80;add_rostest;/opt/ros/melodic/share/rostest/cmake/rostest-extras.cmake;119;_add_rostest_google_test;/home/karan/catkin_ws/src/ddynamic_reconfigure/CMakeLists.txt;58;add_rostest_gmock;/home/karan/catkin_ws/src/ddynamic_reconfigure/CMakeLists.txt;0;")
subdirs("gtest")
