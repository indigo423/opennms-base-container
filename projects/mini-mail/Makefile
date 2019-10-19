include ../_Makefile/generic-settings.mk
include ../_Makefile/make-help.mk

BASE_IMAGE=ubuntu
BASE_IMAGE_VERSION=bionic
S6_OVERLAY_VERSION=v1.22.1.0
VERSION=1.0

.PHONY: all build tag oci push clean

all: build tag oci push

build:
	docker build $(DOCKER_BUILD_FLAGS) \
		--build-arg BASE_IMAGE=$(BASE_IMAGE) \
		--build-arg BASE_IMAGE_VERSION=$(BASE_IMAGE_VERSION) \
		--build-arg BUILD_DATE=${BUILD_DATE} \
		--build-arg S6_OVERLAY_VERSION=$(S6_OVERLAY_VERSION) \
    --build-arg VERSION=$(VERSION) \
		-t $(DOCKER_PROJECT) .

include ../_Makefile/docker-common-cmds.mk
