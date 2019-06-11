#!/bin/bash -e

set -x

# shellcheck source=projects/maven-jdk11/config.sh
source ./config.sh

# shellcheck source=projects/registry-config.sh
source ../registry-config.sh

docker build -t "${CONTAINER_PROJECT}:${IMAGE_VERSION[0]}" \
  --build-arg BASE_IMAGE="${BASE_IMAGE}" \
  --build-arg BASE_IMAGE_VERSION="${BASE_IMAGE_VERSION}" \
  --build-arg VERSION="${VERSION}" \
  --build-arg BUILD_DATE="$(date -u +"%Y-%m-%dT%H:%M:%S%z")" \
  --build-arg MAVEN_URL="${MAVEN_URL}" \
  --build-arg MAVEN_PKG="${MAVEN_PKG}" \
  --build-arg MAVEN_HOME="${MAVEN_HOME}" \
  .

docker image save "${CONTAINER_PROJECT}:${IMAGE_VERSION[0]}" -o "${CONTAINER_IMAGE}"
