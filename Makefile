
all: volumes_dir build up

build:
	docker-compose -f ./srcs/docker-compose.yml build

up:
	docker-compose -f ./srcs/docker-compose.yml up

stop:
	docker-compose -f ./srcs/docker-compose.yml stop

down:
	docker-compose -f ./srcs/docker-compose.yml down

re:
	docker-compose -f srcs/docker-compose.yml up --build

clear_volumes_dir:
	rm -rf /home/nayache/data/wordpress /home/nayache/data/mariadb

clean:
	docker stop $$(docker ps -qa);\
	docker rm $$(docker ps -qa);\
	docker rmi -f $$(docker images -qa);\
	docker volume rm $$(docker volume ls -q);\
	docker network rm $$(docker network ls -q);

fclean: clear_volumes_dir clean

volumes_dir: home/nayache/data/wordpress /home/nayache/data/mariadb

/mnt/nfs/homes/nayache/data/wordpress:
	mkdir -p /home/nayache/data/wordpress

/mnt/nfs/homes/nayache/data/mariadb:
	mkdir -p /home/nayache/data/mariadb

.PHONY: all re down clean
