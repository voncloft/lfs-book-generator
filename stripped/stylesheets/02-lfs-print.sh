bsdtar -xvf /mnt/lfs/sources/lfs-bootscripts-20240416.tar.xz
cd /mnt/lfs/sources/lfs*

find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
