#!/bin/bash

# init repo
repo init -u https://github.com/BlissRoms/stable_releases.git -b refs/tags/v18.7-stable-voyager --git-lfs

git clone https://github.com/mt6768-dev/android_device_xiaomi_earth.git -b lineage-22.2
git clone https://github.com/mt6768-dev/proprietary_vendor_xiaomi_earth.git -b lineage-22.2
git clone https://github.com/mt6768-dev/android_kernel_xiaomi_earth.git -b lineage-23.2
git clone https://github.com/LineageOS/android_hardware_xiaomi.git -b lineage-22.2 hardware/xiaomi
git clone https://github.com/LineageOS/android_hardware_mediatek.git -b lineage-22.2 hardware/mediatek
git clone https://github.com/LineageOS/android_device_mediatek_sepolicy_vndr.git -b lineage-22.2 device/mediatek/sepolicy_vndr
/opt/crave/resync.sh

export BUILD_USERNAME=sarkazz!?
export BUILD_HOSTNAME=Ulinux

. build/envsetup.sh
blissify earth
