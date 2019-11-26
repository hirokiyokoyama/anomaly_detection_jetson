# anomaly_detection_jetson

## How to build
1. clone http://github.com/hirokiyokoyama/anomaly_detection_jetson
1. cd anomaly_detection_jetson
1. Download checkpoint files (model.ckpt.*) from the colab notebook and put them into ./yolo_ckpt/
1. ./build.sh

## How to launch
1. ./run.sh

## Changing threshold
Parameters other than "threshold" are ignored.

### Dynamically (after launching)
1. rosservice call /yolo/set_parameters "{config: {doubles: [{name: threshold, value: 0.82}]}}"

### Eternally
1. Edit 5th argument of "gen.add" (initially 0.1) in ./yolo_ros/cfg/YoloDetector.cfg
1. ./build.sh

## Changing image topic
1. Edit the last line in ./run.sh (initially /camera/image_rect_color)
