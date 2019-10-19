include ../_Makefile/generic-settings.mk
include ../_Makefile/make-help.mk

BASE_IMAGE=no42org/openjdk
BASE_IMAGE_VERSION=11.0.4.11
MAVEN_VERSION=3.6.1
MAVEN_URL=https://www-eu.apache.org/dist/maven/maven-3/$(MAVEN_VERSION)/binaries/apache-maven-$(MAVEN_VERSION)-bin.tar.gz
MAVEN_HOME=/opt/apache-maven-$(MAVEN_VERSION)
VERSION=$(BASE_IMAGE_VERSION)-$(MAVEN_VERSION)
DOCKER_PROJECT=maven

.PHONY: all build tag oci push clean

all: build tag oci push

build:
	docker build $(DOCKER_BUILD_FLAGS) \
		--build-arg BASE_IMAGE=$(BASE_IMAGE) \
		--build-arg BASE_IMAGE_VERSION=$(BASE_IMAGE_VERSION) \
		--build-arg BUILD_DATE=${BUILD_DATE} \
    --build-arg VERSION=$(VERSION) \
		--build-arg MAVEN_VERSION=$(MAVEN_VERSION) \
	  --build-arg MAVEN_URL="${MAVEN_URL}" \
  	--build-arg MAVEN_HOME="${MAVEN_HOME}" \
		-t $(DOCKER_PROJECT) .

include ../_Makefile/docker-common-cmds.mk
