FROM php:7.4-fpm

ADD ./sources.list /etc/apt/sources.list
COPY ./depend_file /var/www/depend_file


#Copy xdebug configration for remote debugging
#COPY ./xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini
#ADD ./php.ini /usr/local/etc/php/
#ADD ./xlaravel.pool.conf /usr/local/etc/php-fpm.d/

WORKDIR /var/www/html


COPY index.php /var/www/html/index.php

ADD run.sh /mnt/run.sh

#CMD ["/mnt/run.sh"]
RUN sh /mnt/run.sh



EXPOSE 80
