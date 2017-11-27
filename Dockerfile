FROM php:7.0-cli-alpine

COPY files/wp /usr/bin/wp
COPY files/wordpress-4.9.tar.gz /cms.tar.gz

RUN apk update \
    && apk add mysql-client \
    && chmod +x /usr/bin/wp \
    && docker-php-ext-install mysqli 
    

COPY install.sh /install
RUN chmod +x /install
ENTRYPOINT ["/install"]
