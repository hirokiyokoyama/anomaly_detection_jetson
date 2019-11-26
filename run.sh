#!/bin/bash

shopt -s expand_aliases
alias ros-container="nvidia-docker run \
	            -e ROS_HOSTNAME=`hostname`.local \
	            --net=host"
xhost +
ros-container -it --rm --name anomaly-detector \
	      -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix \
	      anomaly-detector-jetson \
	      rosrun yolo_ros yolo.py --ckpt=/yolo_ckpt/model.ckpt \
	      image:=/camera/image_rect_color
