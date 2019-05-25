FROM php:5.6-apache

LABEL build_date="2019-05-25"

COPY . /var/www/html

EXPOSE 80

RUN usermod -u 1000 www-data; \
    chown -R www-data:www-data /var/www/html