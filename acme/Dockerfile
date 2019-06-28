FROM debian:buster-slim AS build

RUN apt update && apt install -y --no-install-recommends \
	git \
	ca-certificates \
	gcc \
	libc6-dev

WORKDIR /usr/local/plan9
RUN git clone https://github.com/9fans/plan9port . \
	&& ./INSTALL

FROM debian:buster-slim

COPY --from=build /usr/local/plan9 /usr/local/plan9
ENV PLAN9 /usr/local/plan9

CMD ["/usr/local/plan9/bin/rc"]
