FROM alpine:3.8

ENV FRP_VERSION 0.23.3

RUN wget --no-check-certificate https://github.com/fatedier/frp/releases/download/v${FRP_VERSION}/frp_${FRP_VERSION}_linux_amd64.tar.gz && \ 
    tar xzf frp_${FRP_VERSION}_linux_amd64.tar.gz && \
    cd frp_${FRP_VERSION}_linux_amd64 && \
    mv frps /frps && \
    cd .. && \
    rm -rf *.tar.gz && \
    rm -rf frp_${FRP_VERSION}_linux_amd64 && \
    mkdir /conf

WORKDIR /

VOLUME /conf

EXPOSE 80 443 6000 7000 7500 7001

ENTRYPOINT ["/frps","-c","/conf/frps.ini"]
