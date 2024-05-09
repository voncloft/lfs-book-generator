./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/expat-2.6.2
make
make check
make install
install -v -m644 doc/*.{html,css} /usr/share/doc/expat-2.6.2
sed -e "/^am__append_1/ s/doc//" -i Makefile
make clean
CC="gcc -m32" ./configure \
    --prefix=/usr        \
    --disable-static     \
    --libdir=/usr/lib32  \
    --host=i686-pc-linux-gnu
make
make DESTDIR=$PWD/DESTDIR install
cp -Rv DESTDIR/usr/lib32/* /usr/lib32
rm -rf DESTDIR
sed -e "/^am__append_1/ s/doc//" -i Makefile
make clean
CC="gcc -mx32" ./configure \
    --prefix=/usr        \
    --disable-static     \
    --libdir=/usr/libx32 \
    --host=x86_64-pc-linux-gnux32
make
make DESTDIR=$PWD/DESTDIR install
cp -Rv DESTDIR/usr/libx32/* /usr/libx32
rm -rf DESTDIR
