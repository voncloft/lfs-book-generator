#https://www.linuxfromscratch.org/~thomas/multilib/chapter08/libelf.html
./configure --prefix=/usr                \
            --disable-debuginfod         \
            --enable-libdebuginfod=dummy
make
make check
make -C libelf install
install -vm644 config/libelf.pc /usr/lib/pkgconfig
rm /usr/lib/libelf.a
make distclean
CC="gcc -m32" CXX="g++ -m32" ./configure \
    --host=i686-pc-linux-gnu \
    --prefix=/usr            \
    --libdir=/usr/lib32      \
    --disable-debuginfod     \
    --enable-libdebuginfod=dummy
make
make DESTDIR=$PWD/DESTDIR -C libelf install
install -vDm644 config/libelf.pc DESTDIR/usr/lib32/pkgconfig/libelf.pc
cp -Rv DESTDIR/usr/lib32/* /usr/lib32
rm -rf DESTDIR
make distclean
CC="gcc -mx32" CXX="g++ -mx32" ./configure \
    --host=x86_64-pc-linux-gnux32 \
    --prefix=/usr                 \
    --libdir=/usr/libx32          \
    --disable-debuginfod          \
    --enable-libdebuginfod=dummy
make
make DESTDIR=$PWD/DESTDIR -C libelf install
install -vDm644 config/libelf.pc DESTDIR/usr/libx32/pkgconfig/libelf.pc
cp -Rv DESTDIR/usr/libx32/* /usr/libx32
rm -rf DESTDIR
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
