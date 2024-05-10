#https://www.linuxfromscratch.org/~thomas/multilib/chapter07/Python.html
bsdtar -xvf /mnt/lfs/sources/Python-3.12.3.tar.xz
cd /mnt/lfs/sources/Python*
./configure --prefix=/usr   \
            --enable-shared \
            --without-ensurepip
make
make install
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
