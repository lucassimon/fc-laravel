#!/bin/bash

dockerize -template ./conf.d/nginx.conf:/etc/nginx/conf.d/default.conf -wait tcp://app:9000 -timeout 60s nginx
nginx -t
nginx