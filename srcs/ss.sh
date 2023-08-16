#!/bin/sh

docker-compose down -v
docker system prune -af
docker volume rm srcs_mariadb
docker volume rm srcs_wordpress
rm -rf ~/data/wordpress ~/data/mariadb
mkdir -p ~/data/wordpress ~/data/mariadb
docker-compose up 