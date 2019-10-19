ARG BASE_IMAGE="opennms/centos"
ARG BASE_IMAGE_VERSION="latest"

FROM ${BASE_IMAGE}:${BASE_IMAGE_VERSION}

ARG JDK8_MAJOR_VERSION="1.8.0"
ARG JDK8_VERSION_DETAIL="${JDK8_MAJOR_VERSION}.222.b10"

ARG JDK11_MAJOR_VERSION="11"
ARG JDK11_VERSION_DETAIL="${JDK11_MAJOR_VERSION}.0.4.11"

ARG JAVA_HOME="/usr/lib/jvm/java-1.8.0"

RUN dnf -y install java-${JDK8_MAJOR_VERSION}-openjdk-devel-${JDK8_VERSION_DETAIL} && \
    dnf -y install java-${JDK11_MAJOR_VERSION}-openjdk-devel-${JDK11_VERSION_DETAIL} && \
    dnf clean all && \
    rm -rf /var/cache/yum

ARG BUILD_DATE="1970-01-01T00:00:00+0000"

LABEL maintainer="The OpenNMS Group" \
      license="AGPLv3" \
      name="OpenJDK Development Kit" \
      version="${JDK8_VERSION_DETAIL}-${JDK11_VERSION_DETAIL}" \
      build.date="${BUILD_DATE}" \
      vendor="OpenNMS Community" \
      org.opennms.container.image.java.name="${BASE_IMAGE}" \
      org.opennms.container.image.java8.version="${JDK8_VERSION_DETAIL}" \
      org.opennms.container.image.java11.version="${JDK11_VERSION_DETAIL}" \
      org.opennms.container.image.java.build-date="${BUILD_DATE}"

ENV JAVA_HOME ${JAVA_HOME}
