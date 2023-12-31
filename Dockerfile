FROM php:7.4-fpm
COPY ./tcp.conf /etc/php/7.4/fpm/pool.d
RUN apt update -y
RUN apt install git -y && apt-get install -y \
    libpq-dev \
    libzip-dev \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libicu-dev \
    libxml2-dev \
    zlib1g-dev \
    libonig-dev \
    libcurl4-openssl-dev \
    libtidy-dev \
    libxslt1-dev \
    libssl-dev
RUN docker-php-ext-install pdo_mysql  mbstring xml gd zip bcmath intl json curl tokenizer
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer
WORKDIR /var/www
RUN git clone https://github.com/naveen2112/devopsphp.git
WORKDIR /var/www/devopsphp
RUN composer install
RUN php artisan key:generate
RUN chown -R www-data:www-data /var/www/devopsphp
RUN chmod -R 775 /var/www/devopsphp/storage
RUN chmod +x ./entrypoint.sh
ENTRYPOINT [ "./entrypoint.sh" ]
CMD ["php-fpm"]
