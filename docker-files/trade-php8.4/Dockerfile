FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV COMPOSER_ALLOW_SUPERUSER=1

RUN apt-get update && apt-get install -y  \
    supervisor \
    software-properties-common \
    curl \
    git \
    unzip \
    7zip \
    bash-completion

RUN apt-get install -y vim

RUN mkdir -p /var/log/supervisor

COPY config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php

RUN apt-get install -y php8.4-fpm \
    php8.4-zip

RUN mkdir -p /run/php

RUN mkdir -p /var/www

RUN sed -i 's/listen\ =\ \/run\/php\/php8.4-fpm.sock/listen\ =\ 9000/' /etc/php/8.4/fpm/pool.d/www.conf

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN sed -i '/if \[ -f \/etc\/bash_completion \] && ! shopt -oq posix; then/,/fi/s/^#//g' ~/.bashrc
RUN echo "eval \"\$(/usr/local/bin/composer completion bash)\"" >> ~/.bashrc
RUN echo "eval \"\$(/root/.config/composer/vendor/bin/laravel completion bash)\"" >> ~/.bashrc
RUN echo "PATH=\"$PATH:$HOME/.config/composer/vendor/bin\"" >> ~/.bashrc

RUN composer global require laravel/installer

EXPOSE 9000/tcp

WORKDIR /var/www/panel

CMD ["/usr/bin/supervisord"]