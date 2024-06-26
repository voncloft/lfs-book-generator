#https://www.linuxfromscratch.org/~thomas/multilib/chapter08/libtool.html
bsdtar -xvf /mnt/lfs/sources/libtool-2.4.7.tar.xz
cd /mnt/lfs/sources/libtool*
./configure --prefix=/usr
make
make -k check
make install
rm -fv /usr/lib/libltdl.a
make distclean
CC="gcc -m32" ./configure \
    --host=i686-pc-linux-gnu \
    --prefix=/usr            \
    --libdir=/usr/lib32
make
make DESTDIR=$PWD/DESTDIR install
cp -Rv DESTDIR/usr/lib32/* /usr/lib32
rm -rf DESTDIR
make distclean
CC="gcc -mx32" ./configure \
    --host=x86_64-pc-linux-gnux32 \
    --prefix=/usr                 \
    --libdir=/usr/libx32
make
make DESTDIR=$PWD/DESTDIR install
cp -Rv DESTDIR/usr/libx32/* /usr/libx32
rm -rf DESTDIR
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
