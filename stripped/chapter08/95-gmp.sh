 ./configure ...
./configure --prefix=/usr    \
            --enable-cxx     \
            --disable-static \
            --docdir=/usr/share/doc/gmp-6.3.0
make
make html
make check 2>&1 | tee gmp-check-log
awk '/# PASS:/{total+=$3} ; END{print total}' gmp-check-log
make install
make install-html
make distclean
cp -v configfsf.guess config.guess
cp -v configfsf.sub   config.sub
ABI="32" \
CFLAGS="-m32 -O2 -pedantic -fomit-frame-pointer -mtune=generic -march=i686" \
CXXFLAGS="$CFLAGS" \
PKG_CONFIG_PATH="/usr/lib32/pkgconfig" \
./configure                      \
    --host=i686-pc-linux-gnu     \
    --prefix=/usr                \
    --disable-static             \
    --enable-cxx                 \
    --libdir=/usr/lib32          \
    --includedir=/usr/include/m32/gmp
sed -i 's/$(exec_prefix)\/include/$\(includedir\)/' Makefile
make
make check 2>&1 | tee gmp-check-log
awk '/# PASS:/{total+=$3} ; END{print total}' gmp-check-log
make DESTDIR=$PWD/DESTDIR install
cp -Rv DESTDIR/usr/lib32/* /usr/lib32
cp -Rv DESTDIR/usr/include/m32/* /usr/include/m32/
rm -rf DESTDIR
make distclean
cp -v configfsf.guess config.guess
cp -v configfsf.sub   config.sub
ABI="x32" \
CFLAGS="-mx32 -O2 -pedantic -fomit-frame-pointer -mtune=generic -march=x86-64" \
CXXFLAGS="$CFLAGS" \
PKG_CONFIG_PATH="/usr/libx32/pkgconfig" \
./configure                       \
    --host=x86_64-pc-linux-gnux32 \
    --prefix=/usr                 \
    --disable-static              \
    --enable-cxx                  \
    --libdir=/usr/libx32          \
    --includedir=/usr/include/mx32/gmp
sed -i 's/$(exec_prefix)\/include/$\(includedir\)/' Makefile
make
make check 2>&1 | tee gmp-check-log
awk '/# PASS:/{total+=$3} ; END{print total}' gmp-check-log
make DESTDIR=$PWD/DESTDIR install
cp -Rv DESTDIR/usr/libx32/* /usr/libx32
cp -Rv DESTDIR/usr/include/mx32/* /usr/include/mx32/
rm -rf DESTDIR
