FROM php:7.0-cli-alpine

RUN apk update \
    && apk add curl mysql-client \
    && curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -o /usr/bin/wp \
    && chmod +x /usr/bin/wp \
    && docker-php-ext-install mysqli \
    && reset 
    
RUN mkdir -p /cms \
    && wp core download --path=/cms --allow-root \
    && cd /cms \
    && tar -czvf /cms.tar.gz . \
    && chmod +r /cms.tar.gz \
    && rm -rf /cms

COPY install.sh /install
RUN chmod +x /install
ENTRYPOINT ["/install"]
