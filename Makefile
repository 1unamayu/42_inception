name = inception

all:
	@printf "Launch configuration ${name}...\n"
	
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d

list:
	@echo "            __________NETWORKS__________            \n"
	@docker network ls
	@echo "            ___________VOLUMES___________            \n"
	@docker volume ls
	@echo "            ___________IMAGES___________            \n"
	@docker images
	@echo "            _________CONTAINERS_________            \n"
	@docker ps -a