FROM debian:buster
RUN apt update && apt upgrade
RUN apt install nginx -y
RUN mkdir -p /etc/nginx/ssl 
RUN apt install openssl -y
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=MA/L=Khouribga/O=42/OU=42/CN=akouame.42.fr/UID=akouame"
RUN mkdir -p /var/run/nginx
COPY conf/nginx.conf /etc/nginx/sites-available/default
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html
CMD [ "nginx", "-g", "daemon off;" ]
