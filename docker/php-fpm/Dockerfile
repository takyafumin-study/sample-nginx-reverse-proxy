FROM php:8.1-fpm-alpine

ARG WWWUSER
ARG WWWGROUP

RUN addgroup -S -g $WWWGROUP dev \
 && adduser -u $WWWUSER -G dev -s /bin/sh -D dev

ENV TZ=UTC
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# composer
COPY --from=composer /usr/bin/composer /usr/bin/composer

USER dev
WORKDIR /var/www/html

