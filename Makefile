imageName=docker-test
imageVersion=$(shell git rev-parse --short HEAD)

database_url="mysql://root:fulu1234@127.0.0.1:13306/demo"
docker_database_url="mysql://root:fulu1234@host.docker.internal:13306/demo"

run-dev:
	@export mysql_connection=${database_url} && python app/main.py

build:
	@docker build -t ${imageName}:${imageVersion} ./app/

run-docker: build
	@docker run -d -p 6666:6666 -e mysql_connection=${docker_database_url} ${imageName}:${imageVersion}

clean-docker-image:
	@docker ps | grep "${imageName}:${imageVersion}" | awk '{print $$1}' | xargs docker stop
	@docker ps -a | grep "${imageName}:${imageVersion}" | awk '{print $$1}' | xargs docker rm
	@docker rmi "${imageName}:${imageVersion}"

clean-docker-compose:
	@docker compose stop
	@docker compose rm