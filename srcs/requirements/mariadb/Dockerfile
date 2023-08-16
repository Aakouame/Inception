FROM debian:buster

RUN apt update -y && apt upgrade -y
RUN apt-get install mariadb-server -y
RUN apt-get update && apt-get install procps -y

COPY tools/mariadb_script.sh /
RUN chmod +x /mariadb_script.sh
RUN sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf
CMD bash /mariadb_script.sh

