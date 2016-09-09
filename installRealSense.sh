#!/bin/bash
# Note that you have to use bash for the source command here
# Install realsense_camera package for ROS on the TK1
DEFAULTDIR=~/catkin_ws
CLDIR="$1"
if [ ! -z "$CLDIR" ]; then 
 DEFAULTDIR=~/"$CLDIR"
fi
if [ ! -e "$DEFAULTDIR" ] ; then
  echo "$DEFAULTDIR does not exist; no action taken" 
  exit 1
fi
cd "$DEFAULTDIR"/src
git clone https://github.com/intel-ros/realsense.git
cd realsense
# On Article Publish Date:
# git checkout indigo-devel
# Last tested checkout 9-8-16
git checkout 52e2c87b72c537f3e998dacc7c20a753afbeb9f6 .
cd ..
git clone https://github.com/ros-perception/vision_opencv.git
# cd vision_opencv
# Last checkout on article publish date
# git checkout 2fcc72571965b790600abb8ec147e534972b9f21 .
# Last tested checkout 9-8-16
# git checkout 1b34a3ca0e5ba3c9c2a2825010d47be3f5d0b3f4 .
# cd ..

cd ..
source devel/setup.bash
rosdep install cv_bridge -y
# Install all the dependencies
rosdep install realsense_camera -y
# Now build the packages
catkin_make -j1

