FROM arm32v7/alpine:3.9

ENV FRP_VERSION 0.43.0

RUN wget --no-check-certificate https://github.com/fatedier/frp/releases/download/v${FRP_VERSION}/frp_${FRP_VERSION}_linux_arm.tar.gz && \ 
    tar xzf frp_${FRP_VERSION}_linux_arm.tar.gz && \
    cd frp_${FRP_VERSION}_linux_arm && \
    mv frps /frps && \
    cd .. && \
    rm -rf *.tar.gz && \
    rm -rf frp_${FRP_VERSION}_linux_arm && \
    mkdir /conf

WORKDIR /

VOLUME /conf

EXPOSE 80 443 6000 7000 7500 7001 7002 7003 7004 7005 50001 50002

ENTRYPOINT ["/frps","-c","/conf/frps.ini"]
