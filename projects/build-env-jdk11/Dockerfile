ARG BASE_IMAGE="opennms/maven"
ARG BASE_IMAGE_VERSION="jdk11_3.6.1"

FROM ${BASE_IMAGE}:${BASE_IMAGE_VERSION}

ARG REPO_KEY_URL="https://yum.opennms.org/OPENNMS-GPG-KEY"
ARG REPO_URL="https://yum.opennms.org/repofiles/opennms-repo-bleeding-rhel8.noarch.rpm"
ARG ADD_RPMS="https://yum.opennms.org/stable/rhel8/nsis/mingw32-nsis-2.50-1.el7.centos.x86_64.rpm"
ARG PACKAGES="gettext tree wget git-core openssh-clients which expect make cmake gcc-c++ jq rrdtool-devel automake libtool rpm-build redhat-rpm-config R jicmp jicmp6 jrrd2"
ARG SHELLCHECK_VERSION="0.6.0"

COPY ./rpms /tmp/rpms

SHELL ["/bin/bash", "-c"]

# Install repositories, system and OpenNMS packages and do some cleanup
RUN dnf -y install epel-release dnf-plugins-core && \
    dnf config-manager --set-enabled PowerTools && \
    rpm --import "${REPO_KEY_URL}" && \
    dnf -y install "${REPO_URL}" && \
    dnf -y install ${PACKAGES} && \
    dnf -y install ${ADD_RPMS} && \
    dnf clean all && \
    rm -rf /var/cache/yum
RUN wget -qO- "https://storage.googleapis.com/shellcheck/shellcheck-v${SHELLCHECK_VERSION}.linux.x86_64.tar.xz" | tar -xJv && \
    mv shellcheck-"v${SHELLCHECK_VERSION}"/shellcheck /usr/bin/ && \
    rm -rf shellcheck-*
RUN dnf -y install yum-utils device-mapper-persistent-data lvm2 && \
    dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo && \
    dnf -y install https://download.docker.com/linux/centos/7/x86_64/stable/Packages/containerd.io-1.2.6-3.3.el7.x86_64.rpm && \
    dnf -y install docker-ce docker-ce-cli && \
    dnf clean all && \
    rm -rf /var/cache/yum
RUN if [ "$(ls -1 /tmp/rpms/*.rpm 2>/dev/null | wc -l)" != 0 ]; then cd /tmp/rpms && yum -y localinstall *.rpm; fi && \
    rm -rf /tmp/rpms && \    
    dnf clean all && \
    rm -rf /var/cache/yum

ARG VERSION=${BASE_IMAGE_VERSION}
ARG BUILD_DATE="1970-01-01T00:00:00+0000"

LABEL maintainer="The OpenNMS Group" \
      license="AGPLv3" \
      name="OpenNMS Build Environment" \
      version="${VERSION}" \
      build.date="${BUILD_DATE}" \
      vendor="OpenNMS Community" \
      org.opennms.container.image.os.name="CentOS" \
      org.opennms.container.image.os.version="${VERSION}" \
      org.opennms.container.image.os.build-date="${BUILD_DATE}"
