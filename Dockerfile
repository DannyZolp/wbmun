FROM trafex/php-nginx:latest
USER root
COPY default.conf /etc/nginx/conf.d
RUN apk add --no-cache php81-zip

USER nobody
WORKDIR /var/www/html
RUN wget https://github.com/getgrav/grav/releases/download/1.7.40/grav-admin-v1.7.40.zip
RUN unzip grav-admin-v1.7.40.zip
RUN rm grav-admin-v1.7.40.zip
RUN mv grav-admin/* .
RUN rm -rf grav-admin

EXPOSE 10000
