#https://www.linuxfromscratch.org/~thomas/multilib/chapter02/creatingfilesystem.html
mkfs -v -t ext4 /dev/
<xxx>
<xxx>
mkswap /dev/
<yyy>
<yyy>
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
