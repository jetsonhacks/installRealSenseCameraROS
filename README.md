# installRealSenseCameraROS
Convenience script to install the realsense_camera package for ROS Indigo on the Jetson TK1.
ROS and librealsense should be installed before executing these scripts.

$ ./setupCatkinWorkspace <directoryname>

Will setup a Catkin Workspace named directoryname. If directoryname is omitted, then catkin_ws is assumed.

$ ./installRealSense.sh <directoryname>

Will install realsense_camera in the Catkin Workspace named directoryname. If directoryname is omitted, the catkin_ws 
is assumed.

Note that the Catkin Workspaces will be placed at ~/

