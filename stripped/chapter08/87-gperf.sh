#https://www.linuxfromscratch.org/~thomas/multilib/chapter08/gperf.html
bsdtar -xvf /mnt/lfs/sources/gperf-3.1.tar.gz
cd /mnt/lfs/sources/gperf*
./configure --prefix=/usr --docdir=/usr/share/doc/gperf-3.1
make
make -j1 check
make install
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
