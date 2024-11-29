# Use PHP 8.0 with FPM
FROM php:8.0-fpm-alpine

# Install dependencies for PHP (e.g., PDO, MySQL)
RUN docker-php-ext-install pdo pdo_mysql

# Install Nginx
RUN apk add --no-cache nginx

# Set working directory
WORKDIR /var/www/html

# Copy PHP app files
COPY . .

# Copy Nginx config and site
COPY nginx/default.conf /etc/nginx/conf.d/

# Expose the necessary ports
EXPOSE 80

# Start PHP-FPM and Nginx
CMD ["sh", "-c", "php-fpm & nginx -g 'daemon off;'"]
