#https://www.linuxfromscratch.org/~thomas/multilib/chapter08/man-pages.html
bsdtar -xvf /mnt/lfs/sources/man-pages-6.7.tar.xz
/mnt/lfs/sources/man-db-2.12.1.tar.xz
cd /mnt/lfs/sources/man*
rm -v man3/crypt*
make prefix=/usr install
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
