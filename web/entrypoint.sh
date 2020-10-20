#!/bin/bash
set -eu

#### Configuration ####
nginx_conf_dir=/etc/nginx/conf.d/*.conf
env_var_list='${WEB_DOMAIN} ${TRANSMISSION_HOST} ${SSL_CERTIF} ${SSL_CERTIF_KEY} ${NGINX_HTPASSWD}'
h5ai_url="https://release.larsjung.de/h5ai/h5ai-0.29.2.zip"
downloads_dir="/var/Downloads"

function replace_env_var() {
    envsubst "$1" < $2 > ${2}.temp
    mv $2.temp $2
}

# Check environment variable set + nginx conf
for env_var in $env_var_list; do
    echo "env variable ${env_var}: $(eval echo "$env_var")" 
done
echo "Env variables OK"

for filename in $nginx_conf_dir; do
    replace_env_var "$env_var_list" $filename
done
echo "NGINX configuration files OK"

cd $downloads_dir
wget -O h5ai.zip $h5ai_url
unzip -n h5ai.zip
echo "h5ai installed"

# ENTRYPOINT
echo "Starting server"
/usr/sbin/php-fpm7 && nginx -g "daemon off;"