#https://www.linuxfromscratch.org/~thomas/multilib/chapter08/man-db.html
bsdtar -xvf /mnt/lfs/sources/man-pages-6.7.tar.xz
/mnt/lfs/sources/man-db-2.12.1.tar.xz
cd /mnt/lfs/sources/man*
./configure --prefix=/usr                         \
            --docdir=/usr/share/doc/man-db-2.12.1 \
            --sysconfdir=/etc                     \
            --disable-setuid                      \
            --enable-cache-owner=bin              \
            --with-browser=/usr/bin/lynx          \
            --with-vgrind=/usr/bin/vgrind         \
            --with-grap=/usr/bin/grap             \
            --with-systemdtmpfilesdir=            \
            --with-systemdsystemunitdir=
make
make check
make install
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
