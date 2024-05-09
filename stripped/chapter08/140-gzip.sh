bsdtar -xvf /mnt/lfs/sources/gzip-1.13.tar.xz
cd /mnt/lfs/sources/gzip*
./configure --prefix=/usr
make
make check
make install
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
