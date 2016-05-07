DOCKER_IMAGE := mgcrea/node-openbr
OPENBR_VERSION := 1.1.0

all: build

build:
	@docker build --build-arg OPENBR_VERSION=${OPENBR_VERSION} --tag=${DOCKER_IMAGE}:latest .

base:
	@docker pull mgcrea/node-opencv:2.4

rebuild:
	@docker build --build-arg OPENBR_VERSION=${OPENBR_VERSION} --tag=${DOCKER_IMAGE}:latest .

release: rebuild
	@docker build --build-arg OPENBR_VERSION=${OPENBR_VERSION} --tag=${DOCKER_IMAGE}:${OPENBR_VERSION} .
	@scripts/tag.sh ${DOCKER_IMAGE} ${OPENBR_VERSION}
