docker run -d --privileged \
	-v discord:/home/discord \
	-v $HOME/share/discord:/home/discord/share \
	-v /etc/localtime:/etc/localtime:ro \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-v /run/user/1000/pulse:/run/user/1000/pulse \
	-v /dev/snd:/dev/snd  \
	-v /dev/dri:/dev/dri \
	-v /dev/input:/dev/input \
	-e DISPLAY=$DISPLAY \
	--name discord  wgr/discord 

