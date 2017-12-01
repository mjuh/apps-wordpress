![test-logo](http://ci.intr:90/job/apps/job/wordpress/badge/icon)
# ПРИВЕТ
# WP-CLI 1.4.1, WordPress 4.9.1 
# WORDPRESS INSTALLER
 APPSCAT ["DB_HOST","APP_TITLE""DB_NAME","ADMIN_USERNAME","DB_PASSWORD","DB_USER","ADMIN_EMAIL","ADMIN_PASSWORD","APP_URL"]
``` 
docker run -it --user="$UID:$GID" \
            -e ADMIN_USERNAME=$ADMIN_USERNAME \
            -e DB_NAME=$DB_NAME -e DB_USER=$DB_NAME \ 
            -e DB_PASS=$DB_PASSWORD -e DB_HOST=$DB_HOST \
            -e APP_URL=$APP_URL \
            -e APP_TITLE=$APP_TITLE
            -e ADMIN_PASSWORD=$ADMIN_PASSWORD \
            -e ADMIN_EMAIL=$ADMIN_EMAIL \
            -v $DOC_ROOT:/workdir \ 
            wp-installer:4.9.1
```

