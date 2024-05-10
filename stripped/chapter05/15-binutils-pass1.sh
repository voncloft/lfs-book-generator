#https://www.linuxfromscratch.org/~thomas/multilib/chapter05/binutils-pass1.html
source ~/.bash_profile
bsdtar -xvf /mnt/lfs/sources/binutils-2.42.tar.xz
cd /mnt/lfs/sources/binutils*
mkdir -v build
cd       build
../configure --prefix=$LFS/tools       \
             --with-sysroot=$LFS \
             --target=$LFS_TGT   \
             --disable-nls       \
             --enable-gprofng=no \
             --disable-werror    \
             --enable-default-hash-style=gnu \
             --enable-multilib
make
make install
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
