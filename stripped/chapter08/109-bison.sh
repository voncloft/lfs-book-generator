bsdtar -xvf /mnt/lfs/sources/bison-3.8.2.tar.xz
cd /mnt/lfs/sources/bison*
./configure --prefix=/usr --docdir=/usr/share/doc/bison-3.8.2
make
make check
make install
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
