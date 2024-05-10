#https://www.linuxfromscratch.org/~thomas/multilib/chapter02/aboutlfs.html
export LFS=
/mnt/lfs
echo $LFS
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
