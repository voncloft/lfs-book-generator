bsdtar -xvf /mnt/lfs/sources/less-643.tar.gz
cd /mnt/lfs/sources/less*
./configure --prefix=/usr --sysconfdir=/etc
make
make check
make install
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
