FROM pagespeed/nginx-pagespeed
LABEL maintainer="Osiozekhai Aliu"
COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY conf/default.conf /etc/nginx/conf.d/default.conf
COPY conf/default_ssl.conf /etc/nginx/conf.d/default_ssl.conf
COPY docker-entrypoint.sh /usr/local/bin
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
RUN echo http://dl-2.alpinelinux.org/alpine/edge/community/ >> /etc/apk/repositories
RUN apk update && apk upgrade
RUN apk add --update netcat-openbsd shadow bc curl wget git nano bash openssl tzdata libressl \
    && rm -rf /var/cache/apk/*;