FROM php:7.0-cli-alpine

WORKDIR /workdir
COPY files/wp /usr/bin/wp
ADD files/wp-dist-v.5.3.0 /cms

RUN apk update \
    && apk add mysql-client \
    && chmod +x /usr/bin/wp \
    && docker-php-ext-install mysqli 
    

COPY install.sh /install
RUN chmod +x /install
ENTRYPOINT ["/install"]
