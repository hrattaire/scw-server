FROM nginx:1.19.3-alpine
RUN echo "## Install packages ###"  \
&& apk add --no-cache \
        bash \
         curl \
         findutils \
         php7-fpm  \
         php7-session \
         php7-json

VOLUME /var/www
VOLUME /var/Downloads

RUN echo "## Configure php-fpm ###" \
&& sed -i "s|;listen.owner\s*=\s*nobody|listen.owner = nginx|g" /etc/php7/php-fpm.d/www.conf \
&&  sed -i "s|;listen.group\s*=\s*nobody|listen.group = nginx|g" /etc/php7/php-fpm.d/www.conf

RUN rm /etc/nginx/conf.d/*.conf
COPY nginx/conf.d/ /etc/nginx/conf.d/

COPY entrypoint.sh /entrypoint.sh

EXPOSE 80 4443

ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]
