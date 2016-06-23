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
git checkout indigo-devel
git clone https://github.com/ros-perception/vision_opencv.git
cd ..
source devel/setup.bash
rosdep install cv_bridge -y
# Install all the dependencies
rosdep install realsense_camera -y
# Now build the packages
catkin_make -j1

