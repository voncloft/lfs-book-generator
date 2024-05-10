#https://www.linuxfromscratch.org/~thomas/multilib/chapter06/diffutils.html
source ~/.bash_profile
bsdtar -xvf /mnt/lfs/sources/diffutils-3.10.tar.xz
cd /mnt/lfs/sources/diffutils*
./configure --prefix=/usr   \
            --host=$LFS_TGT \
            --build=$(./build-aux/config.guess)
make
make DESTDIR=$LFS install
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
