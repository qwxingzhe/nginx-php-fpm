#!/bin/bash

cd /var/www/depend_file

apt-get update

apt-get --purge remove libzip

#apt-get install -y zlib-devel
apt-get install zlib1g
apt-get install zlib1g.dev 



tar -zxvf libzip-1.2.0.tar.gz
cd libzip-1.2.0
./configure
make && make install


apt-get install -y \
        libfreetype6-dev \
        libjpeg-dev \
        libpng-dev \
        libmcrypt-dev

docker-php-ext-install zip
docker-php-ext-install -j$(nproc) pdo_mysql
# mcrypt

docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
docker-php-ext-install -j$(nproc) gd
usermod -u 1000 www-data
pecl install -o -f redis
docker-php-ext-enable redis
pecl install xdebug
docker-php-ext-enable xdebug

apt-get install -y nginx

rm -rf /var/www/depend_file

nginx

#php-fpm

tail -f /dev/null
