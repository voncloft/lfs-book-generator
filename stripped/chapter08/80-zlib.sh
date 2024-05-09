bsdtar -xvf /mnt/lfs/sources/zlib-1.3.1.tar.gz
cd /mnt/lfs/sources/zlib*
./configure --prefix=/usr
make
make check
make install
rm -fv /usr/lib/libz.a
make distclean
CFLAGS+=" -m32" CXXFLAGS+=" -m32" \
./configure --prefix=/usr \
    --libdir=/usr/lib32
make
make DESTDIR=$PWD/DESTDIR install
cp -Rv DESTDIR/usr/lib32/* /usr/lib32
rm -rf DESTDIR
make distclean
CFLAGS+=" -mx32" CXXFLAGS+=" -mx32" \
./configure --prefix=/usr    \
    --libdir=/usr/libx32
make
make DESTDIR=$PWD/DESTDIR install
cp -Rv DESTDIR/usr/libx32/* /usr/libx32
rm -rf DESTDIR
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
