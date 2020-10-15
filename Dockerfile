From centos:8

ARG ARCH=amd64

RUN echo "Building for ${ARCH}"

RUN yum install -y centos-release-nfs-ganesha30 && \
    yum install -y nfs-ganesha nfs-ganesha-vfs nfs-utils rpcbind dbus e2fsprogs && \
    yum -y clean all

ENV TINI_VERSION v0.19.0

ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini-${ARCH} /tini
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini-${ARCH}.asc /tini.asc
RUN gpg --batch --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 595E85A6B1B4779EA4DAAEC70B588DFF0527A9B7 \
    && gpg --batch --verify /tini.asc /tini && chmod +x /tini

COPY rootfs /

EXPOSE 111 111/udp 662 2049 38465-38467

ENTRYPOINT ["/tini", "--"]
CMD ["/opt/start_nfs.sh"]
