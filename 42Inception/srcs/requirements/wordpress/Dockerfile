FROM debian:buster
RUN apt-get update -y
RUN apt-get upgrade -y

RUN apt-get -y install wget
RUN apt-get -y install php7.3
RUN apt-get -y install php-fpm
RUN apt-get -y install php-mysql
RUN apt-get -y install mariadb-client
RUN apt-get -y install curl

COPY conf/php.ini /etc/php/7.3/cli/php.ini

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

RUN sed -i "s|listen = /run/php/php7.3-fpm.sock|listen = 9000|g" /etc/php/7.3/fpm/pool.d/www.conf

COPY tools/autoconf.sh /autoconf.sh

RUN mkdir -p /run/php

ENTRYPOINT ["bash", "autoconf.sh"]
