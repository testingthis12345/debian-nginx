# Use official Debian base image
FROM debian:bookworm-slim

# Install Nginx and clean up
RUN apt-get update && \
    apt-get install -y nginx php php-fpm && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy a custom Nginx config (optional)
# COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 80
EXPOSE 80

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]

