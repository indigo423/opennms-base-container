SHELL               := /bin/bash -o pipefail
PROJECT_DIR         = $(shell pwd)
CONTAINER_PROJECT   = $(shell basename $(PROJECT_DIR))
BASE_IMAGE          = centos
BASE_IMAGE_VERSION  = 8
VERSION             = $(BASE_IMAGE_VERSION)
BUILD_DATE          = $(shell date -u +"%Y-%m-%dT%H:%M:%S%z")
DOCKER_BUILD_FLAGS  = 
DOCKER_REGISTRY     = docker.io
DOCKER_ORG          = no42org
DOCKER_PROJECT      = $(CONTAINER_PROJECT)
DOCKER_TAG          = $(DOCKER_REGISTRY)/$(DOCKER_ORG)/$(DOCKER_PROJECT):$(VERSION)
