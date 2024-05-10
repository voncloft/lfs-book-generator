#https://www.linuxfromscratch.org/~thomas/multilib/chapter08/tar.html
bsdtar -xvf /mnt/lfs/sources/tar-1.35.tar.xz
cd /mnt/lfs/sources/tar*
FORCE_UNSAFE_CONFIGURE=1  \
./configure --prefix=/usr
make
make check
make install
make -C doc install-html docdir=/usr/share/doc/tar-1.35
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
