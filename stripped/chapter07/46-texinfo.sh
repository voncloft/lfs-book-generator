#https://www.linuxfromscratch.org/~thomas/multilib/chapter07/texinfo.html
bsdtar -xvf /mnt/lfs/sources/texinfo-7.1.tar.xz
cd /mnt/lfs/sources/texinfo*
./configure --prefix=/usr
make
make install
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
