FROM ros-cnn-packages-jetson-common:tf2.0.0
LABEL maintainer "hirokiyokoyama <h-yokoyama@craft-server.co.jp>"

# setup yolo_ros
ADD yolo_ros /catkin_ws/src/yolo_ros
ADD yolo_ckpt /yolo_ckpt

#RUN . /catkin_ws/devel/setup.sh && apt-get update && rosdep update \
#    && rosdep install -y yolo_ros \
#    && rm -rf /var/lib/apt/lists/*
#RUN . /catkin_ws/devel/setup.sh && cd /catkin_ws && catkin_make
RUN . /opt/ros/melodic/setup.sh && cd /catkin_ws && catkin_make

CMD ["rosrun", "yolo_ros", "yolo.py", \
     "--ckpt=/yolo_ckpt/model.ckpt", \
     "image:=/camera/image_rect_color"]
