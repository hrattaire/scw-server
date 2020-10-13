FROM alpine:3.12.0
RUN \
echo "## Install packages ###" &&\
apk add --no-cache \
        bash \
         curl \
         findutils \
         jq \
         openssl \
         p7zip \
         python3 \
         rsync \
         tar \
         transmission-cli \
         transmission-daemon \
         unrar \
         unzip

EXPOSE 9091 51413
VOLUME /downloads /config
ENTRYPOINT ["/usr/bin/transmission-daemon", "--foreground"]
