#!/bin/bash
#
#1. Modify default IP
sed -i 's/192.168.1.1/192.168.1.91/g' openwrt/package/base-files/files/bin/config_generate
sed -i 's/192.168.$((addr_offset++)).1/192.168.$((addr_offset++)).91/g' openwrt/package/base-files/files/bin/config_generate
