#https://www.linuxfromscratch.org/~thomas/multilib/chapter08/m4.html
bsdtar -xvf /mnt/lfs/sources/m4-1.4.19.tar.xz
cd /mnt/lfs/sources/m4*
./configure --prefix=/usr
make
make check
make install
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
