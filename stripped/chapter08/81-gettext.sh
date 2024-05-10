#https://www.linuxfromscratch.org/~thomas/multilib/chapter08/gettext.html
bsdtar -xvf /mnt/lfs/sources/gettext-0.22.5.tar.xz
cd /mnt/lfs/sources/gettext*
./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/gettext-0.22.5
make
make check
make install
chmod -v 0755 /usr/lib/preloadable_libintl.so
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
