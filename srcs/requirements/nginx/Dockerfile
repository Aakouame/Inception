FROM debian:buster
RUN apt-get update && apt-get install nginx -y
COPY /website /var/www/html/
CMD nginx -g 'daemon off;'
