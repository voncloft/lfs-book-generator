bsdtar -xvf /mnt/lfs/sources/sysvinit-3.09.tar.xz
cd /mnt/lfs/sources/sysvinit*
patch -Np1 -i ../sysvinit-3.09-consolidated-1.patch
make
make install
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
