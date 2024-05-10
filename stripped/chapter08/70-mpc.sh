#https://www.linuxfromscratch.org/~thomas/multilib/chapter08/mpc.html
bsdtar -xvf /mnt/lfs/sources/mpc-1.3.1.tar.gz
cd /mnt/lfs/sources/mpc*
./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/mpc-1.3.1
make
make html
make check
make install
make install-html
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
