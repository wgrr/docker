#!/bin/sh

docker run -d \
	-v /etc/localtime:/etc/localtime:ro \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-v /run/user/1000/pulse/:/tmp/pulse/ \
	-e PULSE_SERVER=/tmp/pulse/native \
	--device /dev/snd:/dev/snd \
	--device /dev/input:/dev/input \
	--device /dev/dri:/dev/dri \
	-e DISPLAY=$DISPLAY \
	-v spotify:/home/spotify/.config/spotify \
	-v spotifycache:/home/spotify/spotify \
	--name spotify \
	--log-opt max-size=5m --log-opt max-file=5 \
	wgr/spotify

