FROM debian:buster-slim

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV TZ=UTC

RUN apt-get update && apt-get install -y --no-install-recommends \
	locales \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
	&& locale-gen \
	&& /usr/sbin/update-locale LANG=en_US.UTF-8 \
	&& ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
	&& echo $TZ > /etc/timezone

WORKDIR /root
RUN apt-get update && apt-get install -y --no-install-recommends \
	wget ca-certificates procps \
	libgl1-mesa-dri \
	libgl1-mesa-glx \
	libalsaplayer0 \
	alsa-utils \
	libasound2-data \
	libasound2 \
	libatomic1 \
	libgconf-2-4 \
	libnotify4 \
	libnspr4 \
	libnss3 \
	libxss1 \
	libxtst6 \
	libappindicator1 \
	libc++1 \
	libx11-xcb1 \
	libgtk-3-0 \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*
RUN wget -O discord.deb -q https://dl.discordapp.net/apps/linux/0.0.9/discord-0.0.9.deb && \
	dpkg -i discord.deb

ENV HOME /home/discord
RUN useradd --create-home --home-dir $HOME discord \
	&& gpasswd -a discord audio \
	&& chown -R discord:discord $HOME

COPY start.sh /usr/local/bin/start.sh

WORKDIR /home/discord

CMD [ "start.sh" ]
