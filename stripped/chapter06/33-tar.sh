#https://www.linuxfromscratch.org/~thomas/multilib/chapter06/tar.html
source ~/.bash_profile
bsdtar -xvf /mnt/lfs/sources/tar-1.35.tar.xz
cd /mnt/lfs/sources/tar*
./configure --prefix=/usr                     \
            --host=$LFS_TGT                   \
            --build=$(build-aux/config.guess)
make
make DESTDIR=$LFS install
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
