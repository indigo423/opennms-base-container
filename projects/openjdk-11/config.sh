#!/bin/bash -e

# shellcheck disable=SC2034

# Base Image Dependency
BASE_IMAGE="opennms/centos"
BASE_IMAGE_VERSION="7.6.1810"
BUILD_DATE="$(date -u +"%Y-%m-%dT%H:%M:%S%z")"

# Specific container config
JDK_MAJOR_VERSION="11"
JDK_VERSION_DETAIL="${MAJOR_VERSION}.0.2.7"
BUILD_NUMBER="b1"
FLOATING_VERSION="latest"
IMAGE_VERSION=("${JDK_VERSION_DETAIL}-${BUILD_NUMBER}"
               "${JDK_VERSION_DETAIL}"
               "${JDK_MAJOR_VERSION}"
               "${FLOATING_VERSION}")
