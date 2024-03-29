# 使用 Github Action 在线自动编译 OpenWrt

自动拉取最新 [coolsnowwolf/lede](https://github.com/coolsnowwolf/lede) 源码，根据定制固件文件自动生成配置文件，自动上传编译好的固件镜像文件

## OpenWrt Docker 镜像使用

### 创建一个 macvlan 网络

查看网络接口名称

> Linux 上用 `ip a` 命令

```bash
ip a
```

> Windows 上用 `ipconfig` 命令

```
ipconfig
```

> 在 Linux 下打开网卡的混杂模式，比如上一步查询到网卡的名称是 `eth1`

```bash
ip link set eth1 promisc on
```
创建 macvlan 网络，IP 地址按照自己的网络来设置

```bash
docker network create -d macvlan -o parent=eth0 Network_Name \
  --subnet=192.168.1.0/24 \
  --ip-range=192.168.1.80/28 \
  --gateway=192.168.1.1
```

查看创建好的 macvlan 网络

```bash
docker network list
```

拉取 OpenWrt Docker 镜像

> x86_64

```bash
docker pull ghcr.io/9l/openwrt-build-action/openwrt:latest
```

查看已拉取的 Docker 镜像

```bash
docker images
```

启动容器

```bash
docker run -d --restart always --privileged \
  --network Network_Name --ip=192.168.1.88 \
  --name ladder ghcr.io/9l/openwrt-build-action/openwrt:latest /sbin/init
```

查看正在运行的容器

```bash
docker ps
```

进入 Openwrt 终端后台，修改网络接口 IP 地址

```bash
docker exec -it ladder ash
nano /etc/config/network
/etc/init.d/network restart
exit
```

关闭容器

```bash
docker stop ladder
```

删除容器

```bash
docker rm ladder
```

删除镜像

```bash
docker rmi ghcr.io/9l/openwrt-build-action/openwrt:latest
```
