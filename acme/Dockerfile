FROM debian:buster-slim AS build

RUN apt update && apt install -y \
	git \
	ca-certificates \
	gcc \
	libc6-dev \
	libxt-dev \
	libx11-dev \
	libxcb1-dev \
	libxau-dev \
	libxdmcp-dev \
	libbsd-dev \
	libfreetype6-dev \
	libfontconfig1-dev \
	libexpat1-dev \
	libxext-dev 

WORKDIR /usr/local/plan9
RUN git clone https://github.com/9fans/plan9port . \
	&& ./INSTALL

FROM debian:buster-slim

RUN apt-get update && apt-get install -y \
	git \
	gcc \
	golang-go \
	libxt6 \
	libx11-6 \
	libxcb1 \
	libxau6 \
	libxdmcp6 \
	libbsd0 \
	libfreetype6 \
	libfontconfig1 \
	libexpat1 \
	libxext6

COPY --from=build /usr/local/plan9 /usr/local/plan9
ENV PATH /usr/local/plan9/bin:$PATH
ENV PLAN9 /usr/local/plan9

CMD ["acme"]
