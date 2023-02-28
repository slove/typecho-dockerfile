FROM php:7.4-fpm

RUN apt-get update || : && apt-get install git unzip wget libzip-dev -y
RUN docker-php-ext-install  mysqli pdo pdo_mysql bcmath zip


RUN set -e

RUN cd ~

RUN wget http://typecho.org/build.tar.gz -O typecho.tgz
RUN tar zxvf typecho.tgz
RUN mv build/* /var/www/html
RUN rm -f typecho.tgz

RUN chown -R www-data:www-data /var/www/html

CMD ["php-fpm"]
