#!/bin/bash

set -ex

mkdir -p package/new

# Access Control
cp -rf ../immortalwrt-luci/applications/luci-app-accesscontrol package/new/

# ADBYBY Plus +
svn export https://github.com/coolsnowwolf/luci/trunk/applications/luci-app-adbyby-plus package/new/luci-app-adbyby-plus
cp -rf ../immortalwrt-packages/net/adbyby package/new/

# arpbind
cp -rf ../immortalwrt-luci/applications/luci-app-arpbind package/new/

# AutoCore
cp -rf ../immortalwrt/package/emortal/autocore package/new/

# automount
svn export https://github.com/coolsnowwolf/lede/trunk/package/lean/automount package/new/automount
svn export https://github.com/coolsnowwolf/lede/tree/master/package/lean/ntfs3-mount package/new/ntfs3-mount
svn export https://github.com/coolsnowwolf/lede/tree/master/package/lean/ntfs3-oot package/new/ntfs3-oot

# cpufreq
cp -rf ../immortalwrt-luci/applications/luci-app-cpufreq package/new/

# DDNS
cp -rf ../immortalwrt-packages/net/ddns-scripts_aliyun package/new/
cp -rf ../immortalwrt-packages/net/ddns-scripts_dnspod package/new/

# Filetransfer
cp -rf ../immortalwrt-luci/applications/luci-app-filetransfer package/new/
cp -rf ../immortalwrt-luci/libs/luci-lib-fs package/new/

# FullCone
cp -rf ../immortalwrt/package/kernel/fullconenat package/kernel/
cp -f ../immortalwrt/target/linux/generic/hack-5.10/952-net-conntrack-events-support-multiple-registrant.patch target/linux/generic/hack-5.10/
patch -d feeds/luci -p1 -i ../../../patches/fullconenat-luci.patch
cp -rf ../immortalwrt/package/network/config/firewall/patches package/network/config/firewall/

# IPSEC
cp -rf ../immortalwrt-luci/applications/luci-app-ipsec-vpnd package/new/

# OLED
git clone -b master --depth 1 --single-branch https://github.com/NateLol/luci-app-oled package/new/luci-app-oled

# OpenClash
git clone -b master --depth 1 --single-branch https://github.com/vernesong/OpenClash package/new/luci-app-openclash

# Realtek RTL8811CU/RTL8821CU
cp -rf ../immortalwrt/package/kernel/rtl8821cu package/new/

# Realtek 8812BU/8822BU
cp -rf ../immortalwrt/package/kernel/rtl88x2bu package/new/

# Realtek RTL8192EU
cp -rf ../immortalwrt/package/kernel/rtl8192eu package/new/

# Release Ram
cp -rf ../immortalwrt-luci/applications/luci-app-ramfree package/new/

# Scheduled Reboot
cp -rf ../immortalwrt-luci/applications/luci-app-autoreboot package/new/

# SeverChan
git clone -b master --depth 1 --single-branch https://github.com/tty228/luci-app-serverchan package/new/luci-app-serverchan

# ShadowsocksR Plus+
git clone -b master --depth 1 --single-branch https://github.com/fw876/helloworld package/helloworld
rm -rf ./feeds/packages/net/kcptun
rm -rf ./feeds/packages/net/xray-core
rm -rf ./feeds/packages/net/shadowsocks-libev
cp -rf ../immortalwrt-packages/net/dns2socks package/new/
cp -rf ../immortalwrt-packages/net/ipt2socks package/new/
cp -rf ../immortalwrt-packages/net/kcptun package/new/
cp -rf ../immortalwrt-packages/net/microsocks package/new/
cp -rf ../immortalwrt-packages/net/pdnsd-alt package/new/
cp -rf ../immortalwrt-packages/net/redsocks2 package/new/
cp -rf ../immortalwrt-packages/net/shadowsocks-libev package/new/
# building ssr-libev with libmbedtls
patch -d package/helloworld -p1 -i ../../../patches/building-ssr-libev-with-libmbedtls.patch

# Traffic Usage Monitor
git clone -b master --depth 1 --single-branch https://github.com/brvphoenix/wrtbwmon package/new/wrtbwmon
git clone -b master --depth 1 --single-branch https://github.com/brvphoenix/luci-app-wrtbwmon package/new/luci-app-wrtbwmon

# upx & ucl
svn export https://github.com/coolsnowwolf/lede/trunk/tools/ucl tools/ucl
svn export https://github.com/coolsnowwolf/lede/trunk/tools/upx tools/upx
sed -i '/builddir dependencies/i\tools-y += ucl upx' tools/Makefile
sed -i '/builddir dependencies/a\$(curdir)/upx/compile := $(curdir)/ucl/compile' tools/Makefile

# USB Printer
svn export https://github.com/coolsnowwolf/luci/trunk/applications/luci-app-usb-printer package/new/luci-app-usb-printer

# vlmcsd
cp -rf ../immortalwrt-luci/applications/luci-app-vlmcsd package/new/
cp -rf ../immortalwrt-packages/net/vlmcsd package/new/

# xlnetacc
cp -rf ../immortalwrt-luci/applications/luci-app-xlnetacc package/new/

# Zerotier
cp -rf ../immortalwrt-luci/applications/luci-app-zerotier package/new/

# default settings and translation
cp -rf ../default-settings package/new/

# max conntrack
sed -i 's,16384,65536,g' package/kernel/linux/files/sysctl-nf-conntrack.conf

# fix include luci.mk
find package/new/ -type f -name Makefile -exec sed -i 's,../../luci.mk,$(TOPDIR)/feeds/luci/luci.mk,g' {} +

exit 0