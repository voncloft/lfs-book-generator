#https://www.linuxfromscratch.org/~thomas/multilib/chapter08/lz4.html
bsdtar -xvf /mnt/lfs/sources/lz4-1.9.4.tar.gz
cd /mnt/lfs/sources/lz4*
make BUILD_STATIC=no
make -j1 check
make BUILD_STATIC=no PREFIX=/usr install
make clean
CC="gcc -m32" make BUILD_STATIC=no
make BUILD_STATIC=no PREFIX=/usr LIBDIR=/usr/lib32 DESTDIR=$(pwd)/m32 install 
cp -a m32/usr/lib32/* /usr/lib32/

make clean
CC="gcc -mx32" make BUILD_STATIC=no
make BUILD_STATIC=no PREFIX=/usr LIBDIR=/usr/libx32 DESTDIR=$(pwd)/mx32 install 
cp -a mx32/usr/libx32/* /usr/libx32/
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
