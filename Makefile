# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: xamayuel <xamayuel@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/06/17 16:22:05 by xamayuel          #+#    #+#              #
#    Updated: 2024/06/17 18:59:16 by xamayuel         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# https://github.com/llescure/42_Inception/blob/main/Makefile
# https://github.com/malatini42/inception/ 

#https://github.com/Forstman1/inception-42
BLACK		:= $(shell tput -Txterm setaf 0)
RED			:= $(shell tput -Txterm setaf 1)
GREEN		:= $(shell tput -Txterm setaf 2)
YELLOW		:= $(shell tput -Txterm setaf 3)
LIGHTPURPLE	:= $(shell tput -Txterm setaf 4)
PURPLE		:= $(shell tput -Txterm setaf 5)
BLUE		:= $(shell tput -Txterm setaf 6)
WHITE		:= $(shell tput -Txterm setaf 7)
RESET		:= $(shell tput -Txterm sgr0)

COMPOSE_FILE=./srcs/docker-compose.yml

all: help

help:
	@echo "$(YELLOW)Available commands:$(RESET)"
	@echo "$(GREEN)make run$(RESET)           - Build files for volumes and containers."
	@echo "$(GREEN)make up$(RESET)            - Build files for volumes and start containers in the background."
	@echo "$(GREEN)make debug$(RESET)         - Build files for volumes and start containers with verbose logging."
	@echo "$(GREEN)make list$(RESET)          - List all containers."
	@echo "$(GREEN)make list_volumes$(RESET)  - List all Docker volumes."
	@echo "$(GREEN)make clean$(RESET)         - Stop and remove all containers, images, volumes, networks, and local data."

run: 
	@echo "$(GREEN)Building files for volumes ... $(RESET)"
	@sudo mkdir -p /home/xamayuel/data/wordpress
	@sudo mkdir -p /home/xamayuel/data/mariadb
	@echo "$(GREEN)Building containers ... $(RESET)"
	@docker-compose -f $(COMPOSE_FILE) up --build

up:
	@echo "$(GREEN)Building files for volumes ... $(RESET)"
	@sudo mkdir -p /home/xamayuel/data/wordpress
	@sudo mkdir -p /home/xamayuel/data/mariadb
	@echo "$(GREEN)Building containers in background ... $(RESET)"
	@docker-compose -f $(COMPOSE_FILE) up -d --build

debug:
	@echo "$(GREEN)Building files for volumes ... $(RESET)"
	@sudo mkdir -p /home/xamayueldata/wordpress
	@sudo mkdir -p /home/xamayuel/data/mariadb
	@echo "$(GREEN)Building containers with log information ... $(RESET)"
	@docker-compose -f $(COMPOSE_FILE) --verbose up

list:	
	@echo "$(PURPLE)Listing all containers ... $(RESET)"
	 docker ps -a

list_volumes:
	@echo "$(PURPLE)Listing volumes ... $(RESET)"
	docker volume ls

clean: 	
	@echo "$(RED)Stopping containers ... $(RESET)"
	@docker-compose -f $(COMPOSE_FILE) down
	@-docker ps --format "{{.ID}} {{.Names}}" | grep -v "portainer" | awk '{print $1}' | xargs -I {} docker stop {}
	@-docker ps --format "{{.ID}} {{.Names}}" | grep -v "portainer" | awk '{print $1}' | xargs -I {} docker rm {}
	@echo "$(RED)Deleting all images ... $(RESET)"
	@-docker images --format "{{.Repository}}:{{.Tag}}" | grep -v "portainer" | xargs -I {} docker rmi {}
	@echo "$(RED)Deleting all volumes ... $(RESET)"
	@-docker volume rm `docker volume ls -q`
	@echo "$(RED)Deleting all network ... $(RESET)"
	@-docker network rm `docker network ls -q`
	@echo "$(RED)Deleting all data ... $(RESET)"
	@sudo rm -rf /home/xamayuel/data/wordpress
	@sudo rm -rf /home/xamayuel/data/mariadb
	@echo "$(RED)Deleting all $(RESET)"

portainer:
	@echo "Building Portainer ...."
	@-docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest

.PHONY: run up debug list list_volumes clean