include ../_Makefile/generic-settings.mk
include ../_Makefile/make-help.mk

BASE_IMAGE=no42org/centos
BASE_IMAGE_VERSION=8
JDK_MAJOR_VERSION=1.8.0
VERSION=$(JDK_MAJOR_VERSION).222.b10
DOCKER_PROJECT=openjdk

.PHONY: all build tag oci push clean

all: build tag oci push

build:
	docker build $(DOCKER_BUILD_FLAGS) \
		--build-arg BASE_IMAGE=$(BASE_IMAGE) \
		--build-arg BASE_IMAGE_VERSION=$(BASE_IMAGE_VERSION) \
		--build-arg BUILD_DATE=${BUILD_DATE} \
    --build-arg JDK_MAJOR_VERSION=$(JDK_MAJOR_VERSION) \
    --build-arg JDK_VERSION_DETAIL=$(VERSION) \
		-t $(DOCKER_PROJECT) .

include ../_Makefile/docker-common-cmds.mk
