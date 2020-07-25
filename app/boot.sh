#!/bin/bash

dockerize -template .env.template:.env -wait tcp://db:3306 -timeout 40s
composer install
php artisan key:generate
php artisan config:cache
php artisan migrate
php-fpm
