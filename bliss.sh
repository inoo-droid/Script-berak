#!/bin/bash

# init repo
repo init -u https://github.com/BlissRoms/stable_releases.git -b refs/tags/v18.7-stable-voyager --git-lfs
/opt/crave/resync.sh

git clone https://github.com/LineageOS/android_device_xiaomi_earth.git -b lineage-22.2

export BUILD_USERNAME=sarkazz!?
export BUILD_HOSTNAME=Ulinux

. build/envsetup.sh
blissify earth
