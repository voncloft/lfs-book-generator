#https://www.linuxfromscratch.org/~thomas/multilib/chapter06/file.html
source ~/.bash_profile
bsdtar -xvf /mnt/lfs/sources/file-5.45.tar.gz
cd /mnt/lfs/sources/file*
mkdir build
pushd build
  ../configure --disable-bzlib      \
               --disable-libseccomp \
               --disable-xzlib      \
               --disable-zlib
  make
popd
./configure --prefix=/usr --host=$LFS_TGT --build=$(./config.guess)
make FILE_COMPILE=$(pwd)/build/src/file
make DESTDIR=$LFS install
rm -v $LFS/usr/lib/libmagic.la
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
