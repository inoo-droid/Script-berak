#!/bin/bash
set -e

# GitHub host key
mkdir -p ~/.ssh
ssh-keyscan -t rsa,ed25519 github.com >> ~/.ssh/known_hosts 2>/dev/null

# local_manifests
if [ ! -d ".repo/local_manifests" ]; then
    git clone https://github.com/inoo-droid/local_manifests.git .repo/local_manifests/
fi
# BLISSS BLISS
repo init -u https://github.com/BlissRoms/stable_releases.git -b refs/tags/v18.7-stable-voyager --git-lfs
# Sync source
/opt/crave/resync.sh

# --- FIX DEVICE TREE FOR BLISS ---

cd device/xiaomi/earth

# Create bliss_earth.mk inheriting from lineage_earth.mk
if [ ! -f "bliss_earth.mk" ]; then
    cat > bliss_earth.mk << 'EOF'
# Inherit from Lineage device config
$(call inherit-product, device/xiaomi/earth/lineage_earth.mk)

# Override product name for Bliss
PRODUCT_NAME := bliss_earth
EOF
fi

# Register bliss_earth.mk in AndroidProducts.mk
if [ -f "AndroidProducts.mk" ]; then
    if ! grep -q "bliss_earth.mk" AndroidProducts.mk; then
        sed -i 's|lineage_earth.mk|bliss_earth.mk \\\n    $(LOCAL_DIR)/lineage_earth.mk|' AndroidProducts.mk
    fi
else
    cat > AndroidProducts.mk << 'EOF'
PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/bliss_earth.mk \
    $(LOCAL_DIR)/lineage_earth.mk
EOF
fi

cd -

# --- BUILD ---

export BUILD_USERNAME='sarkazz!?'
export BUILD_HOSTNAME=Ulinux

source build/envsetup.sh

# Android 15 QPR2 release config
export TARGET_RELEASE=bp1a

# Build
blissify earth
