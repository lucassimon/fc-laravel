FROM php:7.3.6-fpm-alpine3.9

ENV DOCKERIZE_VERSION v0.6.1

WORKDIR /var/www

RUN apk add --no-cache shadow bash mysql-client openssl \
    && rm -rf /var/www/html \
    && docker-php-ext-install pdo pdo_mysql \
    && wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && ln -s public html \
    && usermod -u 1000 www-data

COPY composer.lock composer.json /var/www/
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Copy existing application directory permissions
COPY --chown=www-data:www-data . /var/www

USER www-data

EXPOSE 9000

ENTRYPOINT [ "./boot.sh" ]
