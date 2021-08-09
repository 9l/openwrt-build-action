FROM scratch

ARG TARGETPLATFORM

ADD ./%%ARTIFACT_PATH%%/openwrt-%%ARCH%%-rootfs.tar.gz /

CMD ["/sbin/init"]
