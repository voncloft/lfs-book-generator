cd /mnt/lfs/sources/aboutlfs*
export LFS=
/mnt/lfs
echo $LFS
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
