source ~/.bash_profile
bsdtar -xvf /mnt/lfs/sources/patch-2.7.6.tar.xz
cd /mnt/lfs/sources/patch*
./configure --prefix=/usr   \
            --host=$LFS_TGT \
            --build=$(build-aux/config.guess)
make
make DESTDIR=$LFS install
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
