FROM scratch

ADD ./artifact/openwrt-%%ARCH%%-generic-rootfs.tar.gz /

CMD ["/sbin/init"]
