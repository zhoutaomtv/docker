FROM alpine:3.8

MAINTAINER Toddy Zhou <zhoutaomtv@gmail.com>

RUN buildDeps=" \
		build-base \
		cmake \
		git \
		linux-headers \
		openssl-dev \
	"; \
	set -x \
	&& apk add --update openssl \
	&& apk add $buildDeps \
	&& mkdir -p /usr/src \
	&& cd /usr/src \
	&& git clone https://github.com/ntop/n2n.git \
	&& cd n2n \
	&& cmake . \
	&& make install \
	&& cd / \
	&& rm -fr /usr/src/n2n \
	&& apk del $buildDeps \
	&& rm -rf /var/cache/apk/*

CMD ["/usr/local/sbin/supernode", "-l", "53", "-f"]
