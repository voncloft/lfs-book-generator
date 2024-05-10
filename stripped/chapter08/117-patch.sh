#https://www.linuxfromscratch.org/~thomas/multilib/chapter08/patch.html
bsdtar -xvf /mnt/lfs/sources/patch-2.7.6.tar.xz
cd /mnt/lfs/sources/patch*
./configure --prefix=/usr
make
make check
make install
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
