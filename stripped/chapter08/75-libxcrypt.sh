#https://www.linuxfromscratch.org/~thomas/multilib/chapter08/libxcrypt.html
bsdtar -xvf /mnt/lfs/sources/libxcrypt-4.4.36.tar.xz
cd /mnt/lfs/sources/libxcrypt*
./configure --prefix=/usr                \
            --enable-hashes=strong,glibc \
            --enable-obsolete-api=no     \
            --disable-static             \
            --disable-failure-tokens
make
make check
make install
make distclean
./configure --prefix=/usr                \
            --enable-hashes=strong,glibc \
            --enable-obsolete-api=glibc  \
            --disable-static             \
            --disable-failure-tokens
make
cp -av --remove-destination .libs/libcrypt.so.1* /usr/lib
make distclean
CC="gcc -m32" \
./configure --prefix=/usr                \
            --host=i686-pc-linux-gnu     \
            --libdir=/usr/lib32          \
            --enable-hashes=strong,glibc \
            --enable-obsolete-api=glibc  \
            --disable-static             \
            --disable-failure-tokens
make
cp -av .libs/libcrypt.so* /usr/lib32/ 
make install-pkgconfigDATA 
ln -svf libxcrypt.pc /usr/lib32/pkgconfig/libcrypt.pc
make distclean
CC="gcc -mx32" \
./configure --prefix=/usr                 \
            --host=x86_64-pc-linux-gnux32 \
            --libdir=/usr/libx32          \
            --enable-hashes=strong,glibc  \
            --enable-obsolete-api=glibc   \
            --disable-static              \
            --disable-failure-tokens
make
cp -av .libs/libcrypt.so* /usr/libx32/ 
make install-pkgconfigDATA 
ln -svf libxcrypt.pc /usr/libx32/pkgconfig/libcrypt.pc
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
