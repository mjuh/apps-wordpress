#!/bin/sh
#ENVIRONMENT has been planted
#PREPARING
cd $DOC_ROOT;
tar xvzf /cms.tar.gz -C $DOC_ROOT;
#INSTALL
wp core config --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS --dbhost=$DB_HOST --dbprefix=$DB_PREFIX;
wp core install --path=$DOC_ROOT --url=$DOMAIN --title=Welcome --admin_user=$USER --admin_password=$PASSWORD --skip-email --admin_email=$ADMIN_EMAIL;

