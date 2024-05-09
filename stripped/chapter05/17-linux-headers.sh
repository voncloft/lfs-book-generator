source ~/.bash_profile
bsdtar -xvf /mnt/lfs/sources/linux-6.8.8.tar.xz
cd /mnt/lfs/sources/linux*
make mrproper
make headers
find usr/include -type f ! -name '*.h' -delete

cp -rv usr/include $LFS/usr
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
