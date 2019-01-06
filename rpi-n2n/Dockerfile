FROM multiarch/debian-debootstrap:armhf-stretch AS builder

WORKDIR /usr/src

RUN apt-get update && apt-get install -y \
	gcc \
	libc6-dev \
        libssl-dev \
        ca-certificates \
        make \
	--no-install-recommends \
	&& rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/ntop/n2n/archive/2.4.tar.gz \
    && tar zxvf 2.4.tar.gz \
    && cd n2n-2.4 \
    && make \
    && ls -l

FROM arm32v6/alpine:3.8
COPY --from=builder /usr/src/n2n-2.4/supernode /usr/bin
COPY --from=builder /usr/src/n2n-2.4/edge /usr/bin

EXPOSE 7654 7654/udp
EXPOSE 5645 5645/udp

ENTRYPOINT ["/usr/bin/supernode", "-f"]
