#!/bin/sh
#ENVIRONMENT has been planted
#PREPARING
tar xvzf /cms.tar.gz;
#INSTALL
wp core config --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS --dbhost=$DB_HOST --dbprefix=$DB_PREFIX;
wp core install --path=/workdir --url=$APP_URL --title=$APP_TITLE --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASSWORD --skip-email --admin_email=$ADMIN_EMAIL;

