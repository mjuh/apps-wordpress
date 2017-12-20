#!/bin/sh
#ENVIRONMENT has been planted
#COPY DIST to WORKDIR
cp -r /cms/* .;
rm -f wp-config.php
#CONFIG and INSTALL
DB_PREFIX=$(cat /dev/urandom | tr -dc a-z | head -c 4)_
wp core config --locale=ru_RU --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASSWORD --dbhost=$DB_HOST --dbprefix=$DB_PREFIX;
wp core install --path=/workdir --url=$DOMAIN_NAME --title="$APP_TITLE" --admin_user=$ADMIN_USERNAME --admin_password=$ADMIN_PASSWORD --skip-email --admin_email=$ADMIN_EMAIL;

