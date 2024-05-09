bsdtar -xvf /mnt/lfs/sources/udev-lfs-20230818.tar.xz
cd /mnt/lfs/sources/udev*

find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
