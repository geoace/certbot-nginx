#!/bin/bash

# Ensure APP_DOMAIN is set
if [ -z "$APP_DOMAIN" ]; then
    echo "Error: APP_DOMAIN is not set!"
    exit 1
fi

# Wait for SSL certificates if switching to HTTPS
if [ -f "/etc/letsencrypt/live/$APP_DOMAIN/fullchain.pem" ]; then
    echo "SSL certificates exist, using HTTPS configuration."
    envsubst '$APP_DOMAIN' < /etc/nginx/nginx.https.template > /etc/nginx/nginx.conf
else
    echo "SSL certificates not found, using HTTP configuration."
    envsubst '$APP_DOMAIN' < /etc/nginx/nginx.http.template > /etc/nginx/nginx.conf
fi

# Start Nginx
exec nginx -g "daemon off;"
