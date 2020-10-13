
#!/bin/bash
set -eu

echo "Replace env variables in nginx config"
envsubst '${WEB_DOMAIN} ${TRANSMISSION_HOST} ${SSL_CERTIF} ${SSL_CERTIF_KEY} ${NGINX_HTPASSWD}' \
< /etc/nginx/conf.d/ssl.conf > /etc/nginx/conf.d/ssl.temp
envsubst '${WEB_DOMAIN} ${TRANSMISSION_HOST} ${SSL_CERTIF} ${SSL_CERTIF_KEY} ${NGINX_HTPASSWD}' \
< /etc/nginx/conf.d/default.conf > /etc/nginx/conf.d/default.temp

mv /etc/nginx/conf.d/ssl.temp /etc/nginx/conf.d/ssl.conf
mv /etc/nginx/conf.d/default.temp /etc/nginx/conf.d/default.conf

echo "Starting server"
/usr/sbin/php-fpm7 && nginx -g "daemon off;"
