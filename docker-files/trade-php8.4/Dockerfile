FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV COMPOSER_ALLOW_SUPERUSER=1

RUN apt-get update && apt-get install -y  \
    supervisor \
    software-properties-common \
    curl \
    git \
    unzip \
    7zip

RUN apt-get install -y vim

RUN mkdir -p /var/log/supervisor

COPY config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php

RUN apt-get install -y php8.4-fpm \
    php8.4-zip

RUN mkdir -p /run/php

RUN mkdir -p /var/www

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN echo "PATH=\"$PATH:$HOME/.config/composer/vendor/bin\"" >> ~/.bashrc

RUN composer global require laravel/installer

RUN sed -i 's/listen\ =\ \/run\/php\/php8.4-fpm.sock/listen\ =\ 9000/' /etc/php/8.4/fpm/pool.d/www.conf

EXPOSE 9000/tcp

WORKDIR /var/www/panel

CMD ["/usr/bin/supervisord"]