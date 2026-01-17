FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y apache2 sudo

RUN apt-get install -y vim

RUN groupadd -g 1000 user
RUN useradd -m -u 1000 -g 1000 -s /bin/bash user
RUN echo "user ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

RUN mkdir /etc/apache2/ssl

RUN a2enmod proxy proxy_fcgi rewrite

COPY config/panel.conf /etc/apache2/sites-available/
COPY config/panel-ssl.conf /etc/apache2/sites-available/

RUN sed -i 's/export\ APACHE_RUN_USER=www-data/export\ APACHE_RUN_USER=user/' /etc/apache2/envvars
RUN sed -i 's/export\ APACHE_RUN_GROUP=www-data/export\ APACHE_RUN_GROUP=user/' /etc/apache2/envvars

RUN a2dissite 000-default
RUN a2ensite panel

EXPOSE 80/tcp 443/tcp

CMD ["apache2ctl", "-D", "FOREGROUND"]