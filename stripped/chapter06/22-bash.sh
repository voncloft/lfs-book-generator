#https://www.linuxfromscratch.org/~thomas/multilib/chapter06/bash.html
source ~/.bash_profile
bsdtar -xvf /mnt/lfs/sources/bash-5.2.21.tar.gz
cd /mnt/lfs/sources/bash*
./configure --prefix=/usr                      \
            --build=$(sh support/config.guess) \
            --host=$LFS_TGT                    \
            --without-bash-malloc
make
make DESTDIR=$LFS install
ln -sv bash $LFS/bin/sh
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
