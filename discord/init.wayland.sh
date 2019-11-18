#!/bin/sh

docker run -d --privileged \
	-e DISPLAY=$DISPLAY \
	-e PULSE_SERVER=/tmp/pulse \
	-v discord:/home/wgr \
	-v $HOME/share/discord:/home/wgr/share \
	-v /etc/localtime:/etc/localtime:ro \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-v $XDG_RUNTIME_DIR/pulse:/tmp/pulse \
	-v /dev/snd:/dev/snd  \
	-v /dev/dri:/dev/dri \
	-v /dev/input:/dev/input \
	--name discord  wgr/wdiscord 

