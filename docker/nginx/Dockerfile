FROM nginx:latest

ARG WWWUSER
ARG WWWGROUP

RUN usermod -u $WWWUSER www-data
RUN groupmod -g $WWWGROUP www-data

