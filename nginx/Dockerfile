FROM nginx:alpine

WORKDIR /opt/src

ENV DOCKERIZE_VERSION v0.6.1

RUN apk add --no-cache bash openssl \
    && wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm /etc/nginx/conf.d/default.conf \
    && echo "daemon off;" >> /etc/nginx/nginx.conf

COPY . /opt/src

EXPOSE 80

ENTRYPOINT [ "./boot.sh" ]
