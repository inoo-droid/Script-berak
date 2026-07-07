rm -rf .repo/local_manifests

git clone https://github.com/inoo-droid/local_manifests.git .repo/local_manifests/

# BLISSS BLISS
repo init --depth=1 -u https://github.com/AviumUI/android_manifests -b avium-16.2 --git-lfs
# Sync source
/opt/crave/resync.sh

# --- BUILD ---

export BUILD_USERNAME='sarkazz!?'
export BUILD_HOSTNAME=Ulinux

# Set up environment
. build/envsetup.sh

# Choose a target
lunch lineage_earth-bp4a-user

# To build
m bacon

# Upload files to github
echo "Upload to github will be started..."
if [ -f out/target/product/earth/*.zip ]; then
  bash /opt/crave/github-actions/upload.sh 'avium' 'earth' 'https://github.com/inoo-droid/Earth_Release' 'avium16.2' 
fi
echo "done"
