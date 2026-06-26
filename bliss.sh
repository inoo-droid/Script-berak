#!/bin/bash

# Fix: Add GitHub's host key 
mkdir -p ~/.ssh
ssh-keyscan -t rsa,ed25519 github.com >> ~/.ssh/known_hosts 2>/dev/null

# init repo
repo init -u https://github.com/BlissRoms/stable_releases.git -b refs/tags/v18.7-stable-voyager --git-lfs

/opt/crave/resync.sh

# Your device trees
git clone https://github.com/mt6768-dev/android_device_xiaomi_earth.git -b lineage-22.2 device/xiaomi/earth
git clone https://github.com/mt6768-dev/proprietary_vendor_xiaomi_earth.git -b lineage-22.2 vendor/xiaomi/earth
git clone https://github.com/mt6768-dev/android_kernel_xiaomi_earth.git -b lineage-23.2 kernel/xiaomi/earth
git clone https://github.com/LineageOS/android_hardware_xiaomi.git -b lineage-22.2 hardware/xiaomi
git clone https://github.com/LineageOS/android_hardware_mediatek.git -b lineage-22.2 hardware/mediatek
git clone https://github.com/LineageOS/android_device_mediatek_sepolicy_vndr.git -b lineage-22.2 device/mediatek/sepolicy_vndr

# Wrap special characters in single quotes to avoid bash issues
export BUILD_USERNAME='sarkazz!?'
export BUILD_HOSTNAME=Ulinux

. build/envsetup.sh
blissify earth
