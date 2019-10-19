include ../_Makefile/generic-settings.mk
include ../_Makefile/make-help.mk

BASE_IMAGE=centos
BASE_IMAGE_VERSION=8
JDK8_MAJOR_VERSION=1.8.0
JDK8_VERSION_DETAIL=$(JDK8_MAJOR_VERSION).222.b10
JDK11_MAJOR_VERSION=11
JDK11_VERSION_DETAIL=$(JDK11_MAJOR_VERSION).0.4.11
VERSION=$(JDK8_VERSION_DETAIL)-$(JDK11_VERSION_DETAIL)
JAVA_HOME=/usr/lib/jvm/java-1.8.0

.PHONY: all build tag oci push clean

all: build tag oci push

build:
	docker build $(DOCKER_BUILD_FLAGS) \
		--build-arg BASE_IMAGE=$(BASE_IMAGE) \
		--build-arg BASE_IMAGE_VERSION=$(BASE_IMAGE_VERSION) \
		--build-arg BUILD_DATE=${BUILD_DATE} \
		--build-arg VERSION=$(VERSION) \
	  --build-arg JDK8_MAJOR_VERSION=$(JDK8_MAJOR_VERSION) \
  	--build-arg JDK8_VERSION_DETAIL=$(JDK8_VERSION_DETAIL) \
  	--build-arg JDK11_MAJOR_VERSION=$(JDK11_MAJOR_VERSION) \
  	--build-arg JDK11_VERSION_DETAIL=$(JDK11_VERSION_DETAIL) \
		--build-arg JAVA_HOME=$(JAVA_HOME) \
		-t $(DOCKER_PROJECT) .

include ../_Makefile/docker-common-cmds.mk
