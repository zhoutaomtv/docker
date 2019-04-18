FROM arm32v7/golang:alpine AS builder
LABEL maintainer="Toddy Zhou <zhoutaomtv@gmail.com>"

ENV PKGVER   1.1.1

# Busybox wget needs TLS support, curl is less painful to get working
RUN apk add --no-cache ca-certificates curl && \
    mkdir /go1 || true && \
    cd /go1 && \
    mkdir -p src/github.com/syncthing && \
    export SRCDIR=$PWD && \
    cd src/github.com/syncthing && \
    curl -L https://github.com/syncthing/syncthing/releases/download/v$PKGVER/syncthing-source-v${PKGVER}.tar.gz | tar xzf - && \
    cd syncthing && \
    export GOPATH="$SRCDIR" GOROOT_FINAL="/usr/bin" && \
    go run build.go -no-upgrade -version v${PKGVER} build stdiscosrv

#Building thin container
FROM arm32v7/alpine

RUN apk add --no-cache ca-certificates
COPY --from=builder /go1/src/github.com/syncthing/syncthing/stdiscosrv /usr/local/bin/stdiscosrv

COPY /rootfs /

RUN apk add --no-cache \
    ca-certificates \
    su-exec

ENV STDISCOSRV_UID=1000
ENV STDISCOSRV_GID=1000
ENV STDISCOSRV_HOME=/stdiscosrv

ENTRYPOINT [ "/entrypoint.sh" ]
