#https://www.linuxfromscratch.org/~thomas/multilib/chapter08/acl.html
bsdtar -xvf /mnt/lfs/sources/acl-2.3.2.tar.xz
cd /mnt/lfs/sources/acl*
./configure --prefix=/usr         \
            --disable-static      \
            --docdir=/usr/share/doc/acl-2.3.2
make
make install
make distclean
CC="gcc -m32" ./configure \
    --prefix=/usr         \
    --disable-static      \
    --libdir=/usr/lib32   \
    --libexecdir=/usr/lib32   \
    --host=i686-pc-linux-gnu
make
make DESTDIR=$PWD/DESTDIR install
cp -Rv DESTDIR/usr/lib32/* /usr/lib32
rm -rf DESTDIR
make distclean
CC="gcc -mx32" ./configure \
    --prefix=/usr          \
    --disable-static       \
    --libdir=/usr/libx32   \
    --libexecdir=/usr/libx32   \
    --host=x86_64-pc-linux-gnux32
make
make DESTDIR=$PWD/DESTDIR install
cp -Rv DESTDIR/usr/libx32/* /usr/libx32
rm -rf DESTDIR
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
