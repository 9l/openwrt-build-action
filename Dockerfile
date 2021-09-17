FROM scratch

ARG ARTIFACT_PATH
ARG ARCH

ADD ./$ARTIFACT_PATH/openwrt-$ARCH-rootfs.tar.gz /

CMD ["/sbin/init"]
