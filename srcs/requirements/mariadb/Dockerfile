FROM debian:buster
RUN apt update && apt upgrade
RUN apt-get install mariadb-server -y
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/mariadb_script.sh /etc/path/to/mariadb_script.sh
RUN chmod +x /etc/path/to/mariadb_script.sh && /etc/path/to/mariadb_script.sh