FROM debian:buster

RUN apt upgrade -y
RUN apt update -y
RUN apt install -y nginx
RUN apt install -y openssl
RUN apt install -y vim
RUN apt install -y curl

RUN mkdir -p /etc/nginx/ssl
RUN chmod 700 /etc/nginx/ssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=GE/L=Mulhouse/O=42/OU=42/CN=rbrendle.42.fr/UID=rbrendle"

COPY conf/rbrendle.42.fr.conf /etc/nginx/sites-enabled/

RUN rm /etc/nginx/sites-enabled/default

RUN chmod 777 /var/www/html
RUN chown -R www-data:www-data /var/www/html
CMD ["nginx", "-g", "daemon off;"]
