
start:
	@mkdir -p /home/rbrendle/data/mariadb
	@mkdir -p /home/rbrendle/data/wordpress
	
	@docker compose -f ./srcs/docker-compose.yml up -d --build

stop:
	@docker compose -f ./srcs/docker-compose.yml down

clean: stop
	@sudo rm -rf /home/rbrendle/data/mariadb
	@sudo rm -rf /home/rbrendle/data/wordpress
	@docker system prune -f
	@docker image prune -af
	@docker volume rm srcs_wordpress
	@docker volume rm srcs_mariadb
