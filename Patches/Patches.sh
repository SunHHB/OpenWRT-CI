#!/bin/bash
sed -i '/\/etc\/init\.d\/tailscale/d;/\/etc\/config\/tailscale/d;' ./wrt/feeds/packages/net/tailscale/Makefile
if [[ $WRT_REPO == *"lede"* ]]; then
	sed -i "/#src/d" ./wrt/feeds.conf.default
	sed -i "s|\(src-git luci\).*|\1 https://github.com/coolsnowwolf/luci.git;openwrt-23.05|g" ./wrt/feeds.conf.default

	echo "$WRT_REPO patch has been installed!"
fi
