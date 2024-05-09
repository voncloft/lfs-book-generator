./configure --prefix=/usr    \
            --disable-static \
            --enable-libgdbm-compat
make
make check
make install
make distclean
CC="gcc -m32" CXX="g++ -m32" ./configure \
    --host=i686-pc-linux-gnu      \
    --prefix=/usr                 \
    --libdir=/usr/lib32           \
    --disable-static              \
    --enable-libgdbm-compat
make
make DESTDIR=$PWD/DESTDIR install
cp -Rv DESTDIR/usr/lib32/* /usr/lib32/
rm -rf DESTDIR
make distclean
CC="gcc -mx32" CXX="g++ -mx32" ./configure \
    --host=x86_64-pc-linux-gnux32 \
    --prefix=/usr                 \
    --libdir=/usr/libx32          \
    --disable-static              \
    --enable-libgdbm-compat
make
make DESTDIR=$PWD/DESTDIR install
cp -Rv DESTDIR/usr/libx32/* /usr/libx32/
rm -rf DESTDIR
