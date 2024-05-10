#https://www.linuxfromscratch.org/~thomas/multilib/chapter06/findutils.html
source ~/.bash_profile
bsdtar -xvf /mnt/lfs/sources/findutils-4.9.0.tar.xz
cd /mnt/lfs/sources/findutils*
./configure --prefix=/usr                   \
            --localstatedir=/var/lib/locate \
            --host=$LFS_TGT                 \
            --build=$(build-aux/config.guess)
make
make DESTDIR=$LFS install
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
