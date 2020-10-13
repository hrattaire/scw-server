docker build -t "alpine-web:1.0" .

docker run -it \
  --rm \
  --name=web \
  -p 80:80 \
  -p 443:443 \
  -v $(dirname "$(pwd)")/Downloads:/var/Downloads \
  -v $(dirname "$(pwd)")/www:/var/www \
  -v $(dirname "$(pwd)")/secrets:/etc/secrets \
  -e WEB_DOMAIN=localhost \
  -e TRANSMISSION_HOST=localhost \
  -e SSL_CERTIF=/etc/secrets/cert/server.crt \
  -e SSL_CERTIF_KEY=/etc/secrets/cert/server.key \
  -e NGINX_HTPASSWD=/etc/secrets/.htpasswd \
  alpine-web:1.0
