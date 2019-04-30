FROM arm32v7/alpine

EXPOSE 8080

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \
  apk add tzdata && \
  cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \  
  apk add curl tar openssh-client && \
  VERSION=v1.0.1 && \
  curl -sLk https://github.com/yudai/gotty/releases/download/$VERSION/gotty_linux_arm.tar.gz \
  | tar xzC /usr/local/bin && \
  apk del tar curl && \
  rm -rf /var/cache/apk/*

ENTRYPOINT ["/usr/local/bin/gotty"]
CMD ["--permit-write","--reconnect","/bin/sh"]
