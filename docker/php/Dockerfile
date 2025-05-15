FROM php:8.4.7-fpm-alpine3.20

# Install dependencies and PHP extensions
RUN apk add --no-cache \
    bash \
    git \
    curl \
    libpq \
    postgresql-dev \
    libzip-dev \
    zlib-dev \
    oniguruma-dev \
    && docker-php-ext-install pdo pdo_pgsql zip

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /var/www