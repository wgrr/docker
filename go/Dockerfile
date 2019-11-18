FROM alpine:edge

RUN apk add --no-cache ca-certificates
RUN [ ! -e /etc/nsswitch.conf ] && \
	    echo 'hosts: files dns' > /etc/nsswitch.conf

# big hack for minimal image footprint
RUN set -eux; apk add --no-cache \
	musl-dev gcc bash && \
#	bootstrap
	mkdir /go14 && cd /go14 && \
	wget -O - \
	https://dl.google.com/go/go1.4-bootstrap-20171003.tar.gz | \
	tar -xzf - && \
	cd go/src && \
	GOARCH=amd64 GOOS=linux CGO_ENABLED=0 ./make.bash && \
#	quality 1
	wget -O /go.src.tar.gz \
	https://dl.google.com/go/$(wget -O - https://golang.org/VERSION?m=text).src.tar.gz && \
	mkdir /go-mk1 && cd /go-mk1 && \
	tar -xzf /go.src.tar.gz && \
	cd go/src && \
	GOARCH=amd64 GOOS=linux CGO_ENABLED=0 \
	GOROOT_BOOTSTRAP=/go14/go ./all.bash && \
#	higher quality
	tar -C /usr/local -xzf /go.src.tar.gz && \
	cd /usr/local/go/src && \
	GOARCH=amd64 GOOS=linux CGO_ENABLED=0 \
	GOROOT_BOOTSTRAP=/go-mk1/go \
	GOROOT_FINAL=/usr/local/go ./all.bash && \
#	cleanups
	apk del -r musl-dev gcc bash && \
	rm -rf /go14 && \
	rm -rf /go-mk1 && \
	rm -rf /go.src.tar.gz && \
	rm -rf /usr/local/go/pkg/bootstrap && \
	rm -rf /usr/local/go/pkg/obj && \
	ln /usr/local/go/bin/go /bin/go && \
	ln /usr/local/go/bin/gofmt /bin/gofmt && \
	mkdir /go

ENV GOPATH=/go
WORKDIR /

ENTRYPOINT ["/bin/sh"]
