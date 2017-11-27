# ПРИВЕТ
# WP-CLI 1.4.1, WordPress 4.9 
# WORDPRESS INSTALLER

``` 
docker run -it --user="$UID:$GID" \
            -e USER=$USER \
            -e DOC_ROOT=$DOC_ROOT \
            -e DB_NAME=$DB_NAME -e DB_USER=$DB_NAME \ 
            -e DB_PASS=$DB_PASS -e DB_HOST=$DB_HOST \
            -e DB_PREFIX=wp_ -e DOMAIN=$DOMAIN \
            -e PASSWORD=$ADMIN_PASSWORD \
            -e ADMIN_EMAIL=$ADMIN_EMAIL \
            -v $DOC_ROOT:$DOC_ROOT \ 
            wp-installer:v4.9-test
```

