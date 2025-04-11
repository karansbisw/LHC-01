#
# The MIT License
#
# Copyright (c) 2017 Rafael Muñoz-Salinas
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.
#

# -----------------------------------------------
#   File that provides "make uninstall" target.
#   We use the file "install_manifest.txt".
# -----------------------------------------------
if(NOT EXISTS "/home/karan/catkin_ws/build_isolated/stella_vslam/install/3rd/FBoW/install_manifest.txt")
   message(FATAL_ERROR "Cannot find install manifest: \"/home/karan/catkin_ws/build_isolated/stella_vslam/install/3rd/FBoW/install_manifest.txt\"")
endif(NOT EXISTS "/home/karan/catkin_ws/build_isolated/stella_vslam/install/3rd/FBoW/install_manifest.txt")

file(READ "/home/karan/catkin_ws/build_isolated/stella_vslam/install/3rd/FBoW/install_manifest.txt" files)
string(REGEX REPLACE "\n" ";" files "${files}")
foreach(file ${files})
    message(STATUS "Uninstalling \"$ENV{DESTDIR}${file}\"")
	execute_process(COMMAND rm $ENV{DESTDIR}${file})
endforeach(file)
