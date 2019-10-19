include ../_Makefile/generic-settings.mk
include ../_Makefile/make-help.mk

VERSION=0.16.0
CONFD_URL=https://github.com/kelseyhightower/confd/releases/download/v$(VERSION)/confd-$(VERSION)-linux-amd64

.PHONY: all build tag oci push clean

all: build tag oci push

build:
	docker build $(DOCKER_BUILD_FLAGS) \
		--build-arg BASE_IMAGE=$(BASE_IMAGE) \
		--build-arg BASE_IMAGE_VERSION=$(BASE_IMAGE_VERSION) \
		--build-arg BUILD_DATE=${BUILD_DATE} \
    --build-arg VERSION=$(VERSION) \
		--build-arg CONFD_URL=$(CONFD_URL) \
		-t $(DOCKER_PROJECT) .

include ../_Makefile/docker-common-cmds.mk
