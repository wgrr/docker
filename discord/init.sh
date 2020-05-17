#!/bin/sh 

docker run -d --privileged --ipc host \
	-v discord:/home/discord \
	-v /etc/localtime:/etc/localtime:ro \
	-v $HOME/share/discord:/home/discord/share \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-v /run/user/1000/pulse/:/tmp/pulse/ \
	-e DISPLAY=$DISPLAY \
	-e PULSE_SERVER=/tmp/pulse/native \
	--device /dev/dri \
	--device /dev/input \
	--device /dev/snd \
	--log-opt max-size=5m --log-opt max-file=5 \
	--name discord  wgr/discord 

