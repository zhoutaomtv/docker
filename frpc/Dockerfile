FROM alpine:3.8

ENV FRP_VERSION 0.23.0

RUN wget --no-check-certificate https://github.com/fatedier/frp/releases/download/v${FRP_VERSION}/frp_${FRP_VERSION}_linux_amd64.tar.gz && \ 
    tar xzf frp_${FRP_VERSION}_linux_amd64.tar.gz && \
    cd frp_${FRP_VERSION}_linux_amd64 && \
    mv frpc /frpc && \
    cd .. && \
    rm -rf *.tar.gz && \
    rm -rf frp_${FRP_VERSION}_linux_amd64 && \
    mkdir /conf

WORKDIR /

VOLUME /conf

EXPOSE 50001 50002 50003 50004 50005

ENTRYPOINT ["/frpc","-c","/conf/frpc.ini"]
