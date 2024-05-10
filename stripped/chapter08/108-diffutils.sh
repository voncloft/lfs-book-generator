#https://www.linuxfromscratch.org/~thomas/multilib/chapter08/diffutils.html
bsdtar -xvf /mnt/lfs/sources/diffutils-3.10.tar.xz
cd /mnt/lfs/sources/diffutils*
./configure --prefix=/usr
make
make check
make install
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
