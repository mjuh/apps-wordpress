#!/usr/bin/env bash

APP_DIST_URL="http://localhost:8099/app/5a158925cd460d7f59a247e7/file"
INSTALLER_URL="http://localhost:8099/installer/5a1588f3cd460d7f59a247c0/file"
APP_PATH="/home/dolnigin/test_app_install/site1"
DB_HOST="localhost"
DB_NAME="b100800_test"
DB_USER="root"
DB_PASSWORD="ghjnbghj"
APP_URL="test.id0.su"
APP_TITLE="Тест сайт"
ADMIN_USERNAME="admin"
ADMIN_PASSWORD="qwerty"
ADMIN_EMAIL="dolnigin@majordomo.ru"

: "${APP_DIST_URL:?Need to set APP_DIST_URL non-empty}"
: "${INSTALLER_URL:?Need to set INSTALLER_URL non-empty}"
: "${APP_PATH:?Need to set APP_PATH non-empty}"
: "${DB_HOST:?Need to set DB_HOST non-empty}"
: "${DB_NAME:?Need to set DB_NAME non-empty}"
: "${DB_USER:?Need to set DB_USER non-empty}"
: "${DB_PASSWORD:?Need to set DB_PASSWORD non-empty}"
: "${APP_URL:?Need to set APP_URL non-empty}"
: "${APP_TITLE:?Need to set APP_TITLE non-empty}"
: "${ADMIN_USERNAME:?Need to set ADMIN_USERNAME non-empty}"
: "${ADMIN_PASSWORD:?Need to set ADMIN_PASSWORD non-empty}"
: "${ADMIN_EMAIL:?Need to set ADMIN_EMAIL non-empty}"

installer_file_name="installer.phar"
app_dist_file_name="app.zip"

wget -O "$APP_PATH/$app_dist_file_name" "$APP_DIST_URL" &&

tar -zxvf "$APP_PATH/$app_dist_file_name" --strip-components=1 --directory "$APP_PATH" &&

wget -O "$APP_PATH/$installer_file_name" "$INSTALLER_URL" &&

php ${APP_PATH}/${installer_file_name} config create --path="$APP_PATH" --dbhost="$DB_HOST" --dbname="$DB_NAME" \
--dbuser="$DB_USER" --dbpass="$DB_PASSWORD" --force &&

php ${APP_PATH}/${installer_file_name} db drop --yes --path="$APP_PATH" &&

php ${APP_PATH}/${installer_file_name} db create --path="$APP_PATH" &&

php ${APP_PATH}/${installer_file_name} core install --path="$APP_PATH" --url="$APP_URL" --title="$APP_TITLE" \
--admin_user="$ADMIN_USERNAME" --admin_password="$ADMIN_PASSWORD" --admin_email="$ADMIN_EMAIL" &&

php ${APP_PATH}/${installer_file_name} plugin update --path="$APP_PATH" --all &&

rm "$APP_PATH/$app_dist_file_name" "$APP_PATH/$installer_file_name"
