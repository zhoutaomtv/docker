FROM arm64v8/alpine

ENV FRP_VERSION 0.33.0
ENV FRP_ARCH arm64

RUN wget --no-check-certificate https://github.com/fatedier/frp/releases/download/v${FRP_VERSION}/frp_${FRP_VERSION}_linux_${FRP_ARCH}.tar.gz && \ 
    tar xzf frp_${FRP_VERSION}_linux_${FRP_ARCH}.tar.gz && \
    cd frp_${FRP_VERSION}_linux_${FRP_ARCH} && \
    mv frps /frps && \
    cd .. && \
    rm -rf *.tar.gz && \
    rm -rf frp_${FRP_VERSION}_linux_${FRP_ARCH} && \
    mkdir /conf

WORKDIR /

VOLUME /conf

ENTRYPOINT ["/frps","-c","/conf/frps.ini"]
