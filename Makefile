path = docker

clean:
	docker system prune -a -f

build:
	cd $(path) && docker build -t symfony .

rebuild: clean build

run:
	cd $(path) && docker run --rm -p 81:80 symfony

rerun: rebuild run

compose:
	docker-compose up --build -d

down:
   docker-compose down

up:
   docker-compose up -d

reload: down up

bash-app:
   docker-compose exec app sh