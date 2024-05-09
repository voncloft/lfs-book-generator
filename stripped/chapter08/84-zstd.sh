make prefix=/usr
make check
make prefix=/usr install
rm -v /usr/lib/libzstd.a
make clean
CC="gcc -m32" make prefix=/usr
make prefix=/usr DESTDIR=$PWD/DESTDIR install
cp -Rv DESTDIR/usr/lib/* /usr/lib32/
sed -e "/^libdir/s/lib$/lib32/" -i /usr/lib32/pkgconfig/libzstd.pc
rm -rf DESTDIR
make clean
CC="gcc -mx32" make prefix=/usr
make prefix=/usr DESTDIR=$PWD/DESTDIR install
cp -Rv DESTDIR/usr/lib/* /usr/libx32/
sed -e "/^libdir/s/lib$/libx32/" -i /usr/libx32/pkgconfig/libzstd.pc
rm -rf DESTDIR
