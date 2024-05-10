#https://www.linuxfromscratch.org/~thomas/multilib/chapter08/libffi.html
bsdtar -xvf /mnt/lfs/sources/libffi-3.4.6.tar.gz
cd /mnt/lfs/sources/libffi*
./configure --prefix=/usr          \
            --disable-static       \
            --with-gcc-arch=native
make
make check
make install
make distclean
CC="gcc -m32" CXX="g++ -m32" ./configure \
    --host=i686-pc-linux-gnu \
    --prefix=/usr            \
    --libdir=/usr/lib32      \
    --disable-static         \
    --with-gcc-arch=i686
make
make check
make DESTDIR=$PWD/DESTDIR install
cp -Rv DESTDIR/usr/lib32/* /usr/lib32
rm -rf DESTDIR
make distclean
CC="gcc -mx32" CXX="g++ -mx32" ./configure \
    --host=x86_64-unknown-linux-gnux32 \
    --prefix=/usr            \
    --libdir=/usr/libx32     \
    --disable-static         \
    --with-gcc-arch=x86_64
make
make check
make DESTDIR=$PWD/DESTDIR install
cp -Rv DESTDIR/usr/libx32/* /usr/libx32
rm -rf DESTDIR
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
