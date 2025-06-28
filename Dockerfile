# Use official Debian base image
FROM debian:bookworm-slim

# Install Nginx and clean up
RUN apt-get update && \
    apt-get install -y nginx php php-fpm && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy a custom Nginx config (optional)
# COPY nginx.conf /etc/nginx/nginx.conf
COPY default /etc/nginx/sites-available/default
COPY index.php /var/www/html/index.php

# Expose port 80
EXPOSE 80

# Start Nginx in the foreground
#CMD ["nginx", "-g", "daemon off;"]
CMD ["/bin/bash", "-c", "php-fpm8.2 && chmod 755 /usr/share/nginx/html/* && nginx -g 'daemon off;'"]
