#!/bin/bash
#
#1. Modify default IP
sed -i 's/192.168.1.1/10.8.3.46/g' openwrt/package/base-files/files/bin/config_generate
sed -i 's/192.168.$((addr_offset++)).1/10.8.$((addr_offset++)).46/g' openwrt/package/base-files/files/bin/config_generate
