# Laravel API backend - deploy lên Render
FROM php:8.2-apache

# Bật mod_rewrite cho Laravel
RUN a2enmod rewrite

# Cài extension PHP cần thiết cho Laravel + MySQL
RUN apt-get update && apt-get install -y \
    libzip-dev \
    zip \
    unzip \
    git \
    && docker-php-ext-install pdo pdo_mysql zip bcmath \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Document root trỏ vào public
ENV APACHE_DOCUMENT_ROOT=/var/www/html/public
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

# Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html

# Copy mã nguồn (trừ node_modules, .git, .env)
COPY . .

# Cài dependency PHP (production)
RUN composer install --no-dev --no-interaction --optimize-autoloader

# Script chạy khi container start: cache config, migrate, chạy Apache
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["apache2-foreground"]
