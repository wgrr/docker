FROM debian:sid-slim

RUN	apt-get update && apt-get install -y --no-install-recommends \
	dirmngr \
	gnupg \
	&& apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4773BD5E130D1D45 \
	&& echo "deb http://repository.spotify.com stable non-free" >> /etc/apt/sources.list.d/spotify.list \
	&& apt-get update && apt-get install -y \
	alsa-utils \
	libgl1-mesa-dri \
	libgl1-mesa-glx \
	libpulse0 \
	spotify-client \
	xdg-utils \
	--no-install-recommends \
	&& rm -rf /var/lib/apt/lists/*

ENV HOME /home/spotify
RUN useradd --create-home --home-dir $HOME spotify \
	&& gpasswd -a spotify audio \
	&& chown -R spotify:spotify $HOME

WORKDIR $HOME
USER spotify

ENTRYPOINT	[ "spotify" ]
