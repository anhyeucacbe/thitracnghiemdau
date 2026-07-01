FROM php:8.2-apache

# Cài extension PDO MySQL
RUN docker-php-ext-install pdo pdo_mysql

# Bật rewrite
RUN a2enmod rewrite

# Copy source
COPY . /var/www/html/

ENV APACHE_DOCUMENT_ROOT=/var/www/html/public

RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' \
    /etc/apache2/sites-available/*.conf \
    /etc/apache2/apache2.conf \
    /etc/apache2/conf-available/*.conf

EXPOSE 80