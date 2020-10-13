docker build -t "alpine-transmission:1.0" .

docker run -it \
  --name=transmission \
  -p 9091:9091 \
  -p 51413:51413 \
  -p 51413:51413/udp \
  -v /Users/hugues/Perso/server:/downloads \
  -v /Users/hugues/Perso/server/config:/config \
  alpine-transmission:1.0 \
  --username hugues --password hugues --config-dir=/config
