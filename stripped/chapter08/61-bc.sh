#https://www.linuxfromscratch.org/~thomas/multilib/chapter08/bc.html
bsdtar -xvf /mnt/lfs/sources/bc-6.7.5.tar.xz
cd /mnt/lfs/sources/bc*
CC=gcc ./configure --prefix=/usr -G -O3 -r
make
make test
make install
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
