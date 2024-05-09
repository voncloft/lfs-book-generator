bsdtar -xvf /mnt/lfs/sources/iproute2-6.8.0.tar.xz
cd /mnt/lfs/sources/iproute2*
sed -i /ARPD/d Makefile
rm -fv man/man8/arpd.8
make NETNS_RUN_DIR=/run/netns
make SBINDIR=/usr/sbin install
mkdir -pv             /usr/share/doc/iproute2-6.8.0
cp -v COPYING README* /usr/share/doc/iproute2-6.8.0
<device>
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
