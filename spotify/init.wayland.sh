#!/bin/sh

docker run -d \
	-e DISPLAY=$DISPLAY \
	-e PULSE_SERVER=/tmp/pulse/native \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-v /tmp/wgr/xdg/pulse:/tmp/pulse \
	-v /etc/localtime:/etc/localtime:ro \
	-v /dev/snd:/dev/snd \
	-v spotify:/home/spotify/.config/spotify \
	-v spotify2:/home/spotify/spotify \
	--ipc=host \
	--name spotify \
	wgr/spotify

