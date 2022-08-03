#thanks to Selam G. at https://blog.devgenius.io/how-to-build-debian-packages-from-meson-ninja-d1c28b60e709 ps : i'm one of the 5 people who appreciate this :D

sudo apt update
#pack-deps
sudo apt install debhelper build-essential dh-make
#eddy-deps
sudo apt install valac libgranite-dev libpackagekit-glib2-dev libunity-dev meson ninja-build libzeitgeist-2.0-dev gettext

meson build
cd build 
meson configure -Dprefix=/usr
cd ..
dh_make --createorig -p eddy_0.0.1

dh_auto_configure --buildsystem=meson

DEB_BUILD_OPTIONS='nocheck' dpkg-buildpackage -rfakeroot -us -uc -b

echo "deb file created in $(dirname "$PWD")"
