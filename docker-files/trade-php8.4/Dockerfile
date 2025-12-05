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
    bash-completion \
    sudo

RUN apt-get install -y vim

RUN groupadd -g 1000 user
RUN useradd -m -u 1000 -g 1000 -s /bin/bash user
RUN echo "user ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

RUN mkdir -p /var/log/supervisor

COPY config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php

RUN apt-get install -y php8.4-fpm \
    php8.4-zip \
    php8.4-mbstring \
    php8.4-curl \
    php8.4-xml \
    php8.4-mysql

RUN mkdir -p /run/php

RUN mkdir -p /var/www

RUN sed -i 's/listen\ =\ \/run\/php\/php8.4-fpm.sock/listen\ =\ 9000/' /etc/php/8.4/fpm/pool.d/www.conf
RUN sed -i 's/user\ =\ www-data/user\ =\ user/' /etc/php/8.4/fpm/pool.d/www.conf
RUN sed -i 's/group\ =\ www-data/group\ =\ user/' /etc/php/8.4/fpm/pool.d/www.conf

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN sed -i '/if \[ -f \/etc\/bash_completion \] && ! shopt -oq posix; then/,/fi/s/^#//g' /home/user/.bashrc
RUN echo "eval \"\$(/usr/local/bin/composer completion bash)\"" >> /home/user/.bashrc
RUN echo "eval \"\$(/home/user/.config/composer/vendor/bin/laravel completion bash)\"" >> /home/user/.bashrc
RUN echo "PATH=\"\$PATH:\$HOME/.config/composer/vendor/bin\"" >> /home/user/.bashrc

USER user

RUN composer global require laravel/installer

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

ENV NVM_DIR /home/user/.nvm

RUN . ~/.nvm/nvm.sh && \
    nvm install 20 && \
    nvm use 20 && \
    nvm alias default 20

EXPOSE 9000/tcp

WORKDIR /var/www/panel

USER root

CMD ["/usr/bin/supervisord"]