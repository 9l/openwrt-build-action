FROM scratch

ADD openwrt-%%ARCH%%-generic-rootfs.tar.gz /

CMD ["/sbin/init"]
