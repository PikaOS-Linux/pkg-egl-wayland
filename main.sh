# Clone Upstream
git clone https://github.com/NVIDIA/egl-wayland -b 1.1.12
cp -rvf ./debian ./egl-wayland 
cd ./egl-wayland

# Get build deps
apt-get build-dep ./ -y

# Build package
LOGNAME=root dh_make --createorig -y -l -p egl-wayland_1.1.12
dpkg-buildpackage --no-sign

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/
