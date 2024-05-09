source ~/.bash_profile
bsdtar -xvf /mnt/lfs/sources/gzip-1.13.tar.xz
cd /mnt/lfs/sources/gzip*
./configure --prefix=/usr --host=$LFS_TGT
make
make DESTDIR=$LFS install
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
