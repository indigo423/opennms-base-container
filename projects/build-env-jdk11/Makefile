include ../_Makefile/generic-settings.mk
include ../_Makefile/make-help.mk

BASE_IMAGE=no42org/maven
BASE_IMAGE_VERSION=1.8.0.222.b10-3.6.1
VERSION=jdk11-2.0
DOCKER_PROJECT=build-env

REPO_RELEASE=bleeding
REPO_HOST=yum.opennms.org
REPO_URL=https://$(REPO_HOST)/repofiles/opennms-repo-$(REPO_RELEASE)-rhel8.noarch.rpm
REPO_KEY_URL=https://$(REPO_HOST)/OPENNMS-GPG-KEY
ADD_RPMS= https://$(REPO_HOST)/$(REPO_RELEASE)/rhel8/nsis/mingw32-nsis-2.50-1.el7.centos.x86_64.rpm
PACKAGES=gettext tree wget which expect rrdtool-devel git-core openssh-clients make cmake gcc-c++ jq automake libtool rpm-build redhat-rpm-config R-core jicmp jicmp6 jrrd2
          
SHELLCHECK_VERSION=0.6.0

.PHONY: all build tag oci push clean

all: build tag oci push

build:
	docker build $(DOCKER_BUILD_FLAGS) \
		--build-arg BASE_IMAGE=$(BASE_IMAGE) \
		--build-arg BASE_IMAGE_VERSION=$(BASE_IMAGE_VERSION) \
		--build-arg BUILD_DATE=${BUILD_DATE} \
    --build-arg VERSION=$(VERSION) \
		--build-arg REPO_URL=$(REPO_URL) \
		--build-arg ADD_RPMS="$(ADD_RPMS)" \
		--build-arg PACKAGES="$(PACKAGES)" \
		--build-arg SHELLCHECK_VERSION=$(SHELLCHECK_VERSION) \
		-t $(DOCKER_PROJECT) .

include ../_Makefile/docker-common-cmds.mk
