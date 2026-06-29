# BLISSS BLISS
repo init -u https://github.com/AviumUI/android_manifests -b avium-16.2 --git-lfs
# Sync source
/opt/crave/resync.sh

# --- BUILD ---

export BUILD_USERNAME='sarkazz!?'
export BUILD_HOSTNAME=Ulinux

# Set up environment
. build/envsetup.sh

# Choose a target
lunch lineage_earth-bp4a-userdebug

# To build
m bacon -j$(nproc --all)
