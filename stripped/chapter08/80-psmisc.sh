#https://www.linuxfromscratch.org/~thomas/multilib/chapter08/psmisc.html
bsdtar -xvf /mnt/lfs/sources/psmisc-23.7.tar.xz
cd /mnt/lfs/sources/psmisc*
./configure --prefix=/usr
make
make check
make install
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
