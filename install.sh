#!/bin/sh
#ENVIRONMENT has been planted
#COPY DIST to WORKDIR
cp -r /cms/* .;
#CONFIG and INSTALL
wp core config --locale=ru_RU --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS --dbhost=$DB_HOST ;
wp core install --path=/workdir --url=$APP_URL --title="$APP_TITLE" --admin_user=$ADMIN_USERNAME --admin_password=$ADMIN_PASSWORD --skip-email --admin_email=$ADMIN_EMAIL;

