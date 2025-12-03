FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y apache2

RUN apt-get install -y vim

RUN a2enmod proxy proxy_fcgi rewrite

COPY config/panel.conf /etc/apache2/sites-available/
COPY config/panel-ssl.conf /etc/apache2/sites-available/

RUN a2dissite 000-default
RUN a2ensite panel

EXPOSE 80/tcp 443/tcp

CMD ["apache2ctl", "-D", "FOREGROUND"]