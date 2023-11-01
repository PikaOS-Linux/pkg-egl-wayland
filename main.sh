# Clone Upstream
git clone https://github.com/NVIDIA/egl-wayland -b 1.1.13
cp -rvf ./debian ./egl-wayland 
cd ./egl-wayland
for i in $(cat ../patches/series) ; do echo "Applying Patch: $i" && patch -Np1 -i ../patches/$i || bash -c "echo "Applying Patch $i Failed!" && exit 2"; done

# Get build deps
apt-get build-dep ./ -y

# Build package
LOGNAME=root dh_make --createorig -y -l -p egl-wayland_1.1.13
dpkg-buildpackage --no-sign

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/
