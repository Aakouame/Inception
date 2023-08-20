all:
	docker-compose -f ./srcs/docker-compose.yml up --build
	echo "123+" | sudo -S clear
	echo "172.0.0.1 akouame.fr" | sudo tee -a /etc/hosts

clean:
	docker-compose -f ./srcs/docker-compose.yml down

fclean:
	docker-compose -f ./srcs/docker-compose.yml down -v
	docker system prune -af
	rm -rf ~/data/wordpress ~/data/mariadb
	mkdir -p ~/data/wordpress ~/data/mariadb

re: fclean all

.PHONY: all clean fclean re
