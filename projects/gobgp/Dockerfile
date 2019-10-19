
ARG BASE_IMAGE="centos"
ARG BASE_IMAGE_VERSION="8"

FROM ${BASE_IMAGE}:${BASE_IMAGE_VERSION}

ARG VERSION="2.9.0"

ADD https://github.com/osrg/gobgp/releases/download/v${VERSION}/gobgp_${VERSION}_linux_amd64.tar.gz /tmp/gobgp.tar.gz

RUN tar xzf /tmp/gobgp.tar.gz -C /usr/bin; \
    rm -rf /tmp/gobgp.tar.gz

ARG BUILD_DATE="1970-01-01T00:00:00+0000"

LABEL maintainer="The OpenNMS Group" \
      license="Apache License, Version 2.0" \
      name="gobgp" \
      version="${VERSION}" \
      build.date="${BUILD_DATE}" \
      vendor="OpenNMS Community" \
      org.opennms.container.image.app.maven.name="gobgp" \
      org.opennms.container.image.app.maven.version="${VERSION}" \
      org.opennms.container.image.app.maven.build-date="${BUILD_DATE}"

ENTRYPOINT [ "/usr/bin/gobgpd" ]

CMD [ "--help" ]