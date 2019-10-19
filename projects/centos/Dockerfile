ARG BASE_IMAGE="centos"
ARG BASE_IMAGE_VERSION="8"
ARG VERSION=${BASE_IMAGE_VERSION}

FROM ${BASE_IMAGE}:${BASE_IMAGE_VERSION}

ARG VERSION=${BASE_IMAGE_VERSION}

RUN dnf -y --nodocs update && \
    dnf clean all && \
    rm -rf /var/cache/yum

ARG BUILD_DATE="1970-01-01T00:00:00+0000"
ARG VCS_URL
ARG VCS_REF

LABEL org.opencontainers.image.created="${BUILD_DATE}" \
      org.opencontainers.image.title="CentOS ${BASE_IMAGE_VERSION}" \
      org.opencontainers.image.source="${VCS_URL}" \
      org.opencontainers.image.revision="${VCS_REF}" \
      org.opencontainers.image.version="${VERSION}" \
      org.opencontainers.image.vendor="The OpenNMS Group, Inc." \
      org.opencontainers.image.authors="OpenNMS Community" \
      org.opencontainers.image.licenses="AGPL-3.0" \
      org.opennms.image.base="${BASE_IMAGE}:${BASE_IMAGE_VERSION}"
