IMAGE := current:latest
CONTAINER := current
CURRENT_DIR := /srv/current

build:
	docker build . -t $(IMAGE) || make connect IMAGE=$$(docker images -aq | head -1)
create:
	docker create --name $(CONTAINER) $(IMAGE) /bin/sh

connect:
	docker run --rm -it -v $(CURDIR):$(CURRENT_DIR) $(IMAGE) /bin/sh
run:
	docker run --rm -it -v $(CURDIR):$(CURRENT_DIR) -w $(CURRENT_DIR) $(IMAGE) sh -c '$(COMMAND)'

export:
	docker export $(CONTAINER) > $(CONTAINER).tar
import:
	cat $(CONTAINER).tar | docker import - $(CONTAINER)

remove_containers:
	docker rm $$(docker ps -aq)
remove_images:
	docker rmi $$(docker images -aq)
remove_dangling_images:
	docker rmi $$(docker images -a | grep "^<none>" | awk '{print $$3}')
