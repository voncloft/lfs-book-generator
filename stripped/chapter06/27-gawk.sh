source ~/.bash_profile
bsdtar -xvf /mnt/lfs/sources/gawk-5.3.0.tar.xz
cd /mnt/lfs/sources/gawk*
sed -i 's/extras//' Makefile.in
./configure --prefix=/usr   \
            --host=$LFS_TGT \
            --build=$(build-aux/config.guess)
make
make DESTDIR=$LFS install
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
