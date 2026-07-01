FROM php:8.2-apache

RUN docker-php-ext-install pdo pdo_mysql

RUN a2enmod rewrite

# Copy source
COPY . /var/www/html/

# QUAN TRỌNG: set đúng root
ENV APACHE_DOCUMENT_ROOT /var/www/html/public

# FIX Apache config chuẩn (QUAN TRỌNG)
RUN sed -ri -e 's!/var/www/html!/var/www/html/public!g' \
    /etc/apache2/sites-available/000-default.conf

# FIX quyền + rewrite cho MVC
RUN echo '<Directory /var/www/html/public>\n\
    AllowOverride All\n\
    Require all granted\n\
</Directory>' >> /etc/apache2/apache2.conf

EXPOSE 80