bsdtar -xvf /mnt/lfs/sources/ncurses-6.5.tar.gz
cd /mnt/lfs/sources/ncurses*
./configure --prefix=/usr           \
            --mandir=/usr/share/man \
            --with-shared           \
            --without-debug         \
            --without-normal        \
            --with-cxx-shared       \
            --enable-pc-files       \
            --with-pkg-config-libdir=/usr/lib/pkgconfig
make
DESTDIR
make DESTDIR=$PWD/dest install
install -vm755 dest/usr/lib/libncursesw.so.6.5 /usr/lib
rm -v  dest/usr/lib/libncursesw.so.6.5
sed -e 's/^#if.*XOPEN.*$/#if 1/' \
    -i dest/usr/include/curses.h
cp -av dest/* /
for lib in ncurses form panel menu ; do
    ln -sfv lib${lib}w.so /usr/lib/lib${lib}.so
    ln -sfv ${lib}w.pc    /usr/lib/pkgconfig/${lib}.pc
done
ln -sfv libncursesw.so /usr/lib/libcurses.so
cp -v -R doc -T /usr/share/doc/ncurses-6.5
make distclean
./configure --prefix=/usr     \
            --with-shared     \
            --without-normal  \
            --with-cxx-shared \
            --without-debug   \
            --without-cxx-binding \
            --with-abi-version=5
make sources libs
cp -av lib/lib*.so.5* /usr/lib
make distclean
CC="gcc -m32" CXX="g++ -m32" \
./configure --prefix=/usr           \
            --host=i686-pc-linux-gnu \
            --libdir=/usr/lib32     \
            --mandir=/usr/share/man \
            --with-shared           \
            --without-debug         \
            --without-normal        \
            --with-cxx-shared       \
            --enable-pc-files       \
            --with-pkg-config-libdir=/usr/lib32/pkgconfig
make
make DESTDIR=$PWD/DESTDIR install
mkdir -p DESTDIR/usr/lib32/pkgconfig
for lib in ncurses form panel menu ; do
    rm -vf                    DESTDIR/usr/lib32/lib${lib}.so
    echo "INPUT(-l${lib}w)" > DESTDIR/usr/lib32/lib${lib}.so
    ln -svf ${lib}w.pc        DESTDIR/usr/lib32/pkgconfig/$lib.pc
done
rm -vf                     DESTDIR/usr/lib32/libcursesw.so
echo "INPUT(-lncursesw)" > DESTDIR/usr/lib32/libcursesw.so
ln -sfv libncurses.so      DESTDIR/usr/lib32/libcurses.so
cp -Rv DESTDIR/usr/lib32/* /usr/lib32
rm -rf DESTDIR
make distclean
CC="gcc -mx32" CXX="g++ -mx32" \
./configure --prefix=/usr           \
            --host=x86_64-pc-linux-gnux32 \
            --libdir=/usr/libx32    \
            --mandir=/usr/share/man \
            --with-shared           \
            --without-debug         \
            --without-normal        \
            --enable-pc-files       \
            --with-pkg-config-libdir=/usr/libx32/pkgconfig
make
make DESTDIR=$PWD/DESTDIR install
mkdir -p DESTDIR/usr/libx32/pkgconfig
for lib in ncurses form panel menu ; do
    rm -vf                    DESTDIR/usr/libx32/lib${lib}.so
    echo "INPUT(-l${lib}w)" > DESTDIR/usr/libx32/lib${lib}.so
    ln -svf ${lib}w.pc        DESTDIR/usr/libx32/pkgconfig/$lib.pc
done
rm -vf                     DESTDIR/usr/libx32/libcursesw.so
echo "INPUT(-lncursesw)" > DESTDIR/usr/libx32/libcursesw.so
ln -sfv libncurses.so      DESTDIR/usr/libx32/libcurses.so
cp -Rv DESTDIR/usr/libx32/* /usr/libx32
rm -rf DESTDIR
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
