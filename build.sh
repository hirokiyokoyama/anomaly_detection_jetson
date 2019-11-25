#!/bin/bash

git clone -b tf2.0 https://github.com/hirokiyokoyama/yolo_ros.git
docker build -t anomaly-detector-jetson .
