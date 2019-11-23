FROM debian:sid-slim

ENV HOME /home/wgr

RUN apt-get update && apt-get install -y --no-install-recommends telegram-desktop \
	&& rm -rf /var/lib/apt/lists/*

WORKDIR $HOME

ENTRYPOINT ["telegram-desktop"]

