FROM composer as composer

FROM olkitu/docker-nginx-php-fpm:8

# Install required PHP packages
RUN BUILD_PACKAGES='libmcrypt-dev libxml2-dev oniguruma-dev' \ 
    && apk add --no-cache libmcrypt libxml2 $BUILD_PACKAGES \
    && docker-php-ext-install -j$(nproc) mysqli pdo pdo_mysql tokenizer xml pcntl mbstring \
    && apk del $BUILD_PACKAGES

COPY --from=composer /usr/bin/composer /usr/bin/composer

# Copy Nginx configuration file
COPY configs/nginx-config.conf /etc/nginx/conf.d/default.conf

WORKDIR /var/www/html