ARG BASE_IMAGE="centos"
ARG BASE_IMAGE_VERSION="latest"

FROM ${BASE_IMAGE}:${BASE_IMAGE_VERSION}

ARG JDK_MAJOR_VERSION=1.8.0
ARG JDK_VERSION_DETAIL=${MAJOR_VERSION}.222.b10

ENV JAVA_HOME /usr/lib/jvm/java-1.8.0

RUN dnf -y install java-${JDK_MAJOR_VERSION}-openjdk-devel-${JDK_VERSION_DETAIL} && \
    dnf clean all && \
    rm -rf /var/cache/yum

ARG BUILD_DATE="1970-01-01T00:00:00+0000"

LABEL maintainer="The OpenNMS Group" \
      license="AGPLv3" \
      name="OpenJDK Development Kit" \
      version="${JDK_VERSION_DETAIL}" \
      build.date="${BUILD_DATE}" \
      vendor="OpenNMS Community" \
      org.opennms.container.image.java.name="${BASE_IMAGE}" \
      org.opennms.container.image.java.version="${JDK_VERSION_DETAIL}" \
      org.opennms.container.image.java.build-date="${BUILD_DATE}"