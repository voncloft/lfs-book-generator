#https://www.linuxfromscratch.org/~thomas/multilib/chapter06/make.html
source ~/.bash_profile
bsdtar -xvf /mnt/lfs/sources/make-4.4.1.tar.gz
cd /mnt/lfs/sources/make*
./configure --prefix=/usr   \
            --without-guile \
            --host=$LFS_TGT \
            --build=$(build-aux/config.guess)
make
make DESTDIR=$LFS install
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
