IMAGE := docker-alpine-ruby:latest
CONTAINER := docker-alpine-ruby
WORKDIR := /srv/current

build:
	docker build . -t $(IMAGE) || make sh IMAGE=$$(docker images -aq | head -1)
create:
	docker rm $(CONTAINER) ; docker create --name $(CONTAINER) $(IMAGE) /bin/sh

sh:
	docker run --rm -it -v $(CURDIR):$(WORKDIR) $(IMAGE) /bin/sh
attach:
	docker exec -it $$(docker ps | grep $(IAMGE) | head -1 | awk '{print $$1}') /bin/sh
run:
	docker run --rm -it -v $(CURDIR):$(WORKDIR) -w $(WORKDIR) $(IMAGE)
execute:
	docker run --rm -it -v $(CURDIR):$(WORKDIR) -w $(WORKDIR) $(IMAGE) sh -c '$(COMMAND)'

export:
	docker export $(CONTAINER) > $(CONTAINER).tar
import:
	cat $(CONTAINER).tar | docker import - $(CONTAINER) && rm $(CONTAINER).tar

flatten:
	make create && make export && make import

remove_containers:
	docker rm $$(docker ps -aq)
remove_images:
	docker rmi $$(docker images -aq)
remove_dangling_images:
	docker rmi $$(docker images -a | grep "^<none>" | awk '{print $$3}')
