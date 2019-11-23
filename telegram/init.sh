#!/bin/sh

docker run -d \
	-e DISPLAY=$DISPLAY \
	-v telegram:/home/wgr \
	-v /etc/localtime:/etc/localtime:ro \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-v /dev/snd:/dev/snd  \
	-v /dev/dri:/dev/dri \
	-v /dev/input:/dev/input \
	--name telegram  wgr/telegram

