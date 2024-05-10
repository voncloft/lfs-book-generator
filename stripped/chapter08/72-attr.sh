#https://www.linuxfromscratch.org/~thomas/multilib/chapter08/attr.html
bsdtar -xvf /mnt/lfs/sources/attr-2.5.2.tar.gz
cd /mnt/lfs/sources/attr*
./configure --prefix=/usr     \
            --disable-static  \
            --sysconfdir=/etc \
            --docdir=/usr/share/doc/attr-2.5.2
make
make check
make install
make distclean
CC="gcc -m32" ./configure \
    --prefix=/usr         \
    --disable-static      \
    --sysconfdir=/etc     \
    --libdir=/usr/lib32   \
    --host=i686-pc-linux-gnu
make
make DESTDIR=$PWD/DESTDIR install
cp -Rv DESTDIR/usr/lib32/* /usr/lib32
rm -rf DESTDIR
make distclean
CC="gcc -mx32" ./configure \
    --prefix=/usr          \
    --disable-static       \
    --sysconfdir=/etc      \
    --libdir=/usr/libx32   \
    --host=x86_64-pc-linux-gnux32
make
make DESTDIR=$PWD/DESTDIR install
cp -Rv DESTDIR/usr/libx32/* /usr/libx32
rm -rf DESTDIR
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
