#https://www.linuxfromscratch.org/~thomas/multilib/chapter06/xz.html
source ~/.bash_profile
bsdtar -xvf /mnt/lfs/sources/xz-5.4.6.tar.xz
cd /mnt/lfs/sources/xz*
./configure --prefix=/usr                     \
            --host=$LFS_TGT                   \
            --build=$(build-aux/config.guess) \
            --disable-static                  \
            --docdir=/usr/share/doc/xz-5.4.6
make
make DESTDIR=$LFS install
rm -v $LFS/usr/lib/liblzma.la
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
