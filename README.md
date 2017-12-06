![test-logo](http://ci.intr:90/job/apps/job/wordpress/badge/icon)
# ПРИВЕТ
# WP-CLI 1.4.1, WordPress 4.9.1 
# WORDPRESS INSTALLER
APPSCAT parameters:

    DB_HOST,
    DB_NAME,
    DB_USER,
    DB_PASSWORD,
    ADMIN_USERNAME,
    ADMIN_EMAIL,
    ADMIN_PASSWORD,
    APP_TITLE,
    DOMAIN_NAME,
    APP_VERSION,
    INSTALLER_FILE,
    APP_LOCALE,
    APP_PATH


``` 
docker run -it --user="$UID:$GID" \
            -e ADMIN_USERNAME=$ADMIN_USERNAME \
            -e DB_NAME=$DB_NAME -e DB_USER=$DB_NAME \ 
            -e DB_PASSWORD=$DB_PASSWORD -e DB_HOST=$DB_HOST \
            -e DOMAIN_NAME=$DOMAIN_NAME \
            -e APP_TITLE=$APP_TITLE
            -e ADMIN_PASSWORD=$ADMIN_PASSWORD \
            -e ADMIN_EMAIL=$ADMIN_EMAIL \
            -v DOC_ROOT:/workdir \ 
            wp-installer:4.9.1
```

