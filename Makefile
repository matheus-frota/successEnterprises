## Constants
PWD := $(shell pwd)
VOLUME_NOTEBOOKS := $(PWD)
HOST_NOTEBOOKS := /home/jovyan
IMAGE := success
PORT := 8888

## Docker
jupyter: 
	docker run -p $(PORT):$(PORT) \
	-v $(VOLUME_NOTEBOOKS):$(HOST_NOTEBOOKS) jupyter/scipy-notebook:latest

## Application
run:
	@ echo "GAMER RECOMMENDING SYSTEM"
	@ docker run -it $(IMAGE)

## Preparing
build:
	@ echo "CREATE DOCKER IMAGE"
	@ docker build -t $(IMAGE) .

## Auxiliary Commands
mkdir-%:
	mkdir -p $(PWD)/$*
	chmod a+w $(PWD)/$*