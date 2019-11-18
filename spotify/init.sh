#!/bin/sh

docker run -d \
	-v /etc/localtime:/etc/localtime:ro \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-v /dev/snd:/dev/snd \
	-v /run/user/1000/pulse:/run/user/1000/pulse \
	-e DISPLAY=unix$DISPLAY \
	-v spotify:/home/spotify/.config/spotify \
	-v spotifycache:/home/spotify/spotify \
	--name spotify \
	wgr/spotify

