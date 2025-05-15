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
    autoconf \
    make \
    g++ \
    && docker-php-ext-install pdo pdo_pgsql zip \
    && pecl install redis \
    && docker-php-ext-enable redis

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /var/www