#https://www.linuxfromscratch.org/~thomas/multilib/chapter08/mpfr.html
bsdtar -xvf /mnt/lfs/sources/mpfr-4.2.1.tar.xz
cd /mnt/lfs/sources/mpfr*
./configure --prefix=/usr        \
            --disable-static     \
            --enable-thread-safe \
            --docdir=/usr/share/doc/mpfr-4.2.1
make
make html
make check
make install
make install-html
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
