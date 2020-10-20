docker build -t "alpine-web:1.0" .

docker run -it \
  --rm \
  --name=web \
  -p 80:80 \
  -p 443:443 \
  -v $(dirname "$(pwd)")/Downloads:/var/Downloads \
  -v $(dirname "$(pwd)")/www:/var/www \
  -v $(dirname "$(pwd)")/certs:/etc/nginx/ssl \
  -v $(dirname "$(pwd)")/restrict:/etc/nginx/restrict \
  -e WEB_DOMAIN=localhost \
  -e TRANSMISSION_HOST=localhost \
  -e SSL_CERTIF=/etc/nginx/ssl/server.crt \
  -e SSL_CERTIF_KEY=/etc/nginx/ssl/server.key \
  -e NGINX_HTPASSWD=/etc/nginx/restrict/.htpasswd \
  alpine-web:1.0
