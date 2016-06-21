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
cd ..
source devel/setup.bash
# Install all the dependencies
rosdep install realsense_camera
# Now build the realsense package
catkin_make

