FROM alpine:edge
RUN apk add --no-cache --virtual .buildpack-deps \
                                 ca-certificates \
                                 curl \
                                 tar && \
    curl --location https://github.com/rancher/rancher-compose/releases/download/v0.12.0/rancher-compose-linux-amd64-v0.12.0.tar.gz \
    | tar --gzip --extract --file - --directory /usr/local/bin/ --strip-components 2 && \
    apk del --no-cache .buildpack-deps
WORKDIR /work/
CMD ["ash"]