bsdtar -xvf /mnt/lfs/sources/autoconf-2.72.tar.xz
cd /mnt/lfs/sources/autoconf*
./configure --prefix=/usr
make
make check
make install
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
