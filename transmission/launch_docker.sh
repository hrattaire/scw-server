docker build -t "alpine-transmission:1.0" .

docker run -it \
  --rm \
  --name=transmission \
  -p 9091:9091 \
  -p 51413:51413 \
  -p 51413:51413/udp \
  --mount type=bind,src=${TORRENT_DOWNLOAD_DIR},target=/downloads \
  alpine-transmission:1.0
