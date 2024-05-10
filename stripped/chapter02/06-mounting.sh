#https://www.linuxfromscratch.org/~thomas/multilib/chapter02/mounting.html
mkdir -pv $LFS
mount -v -t ext4 /dev/
<xxx>
 $LFS
<xxx>
mkdir -pv $LFS
mount -v -t ext4 /dev/
<xxx>
 $LFS
mkdir -v $LFS/home
mount -v -t ext4 /dev/
<yyy>
 $LFS/home
<xxx>
<yyy>
<xxx>
/sbin/swapon -v /dev/
<zzz>
<zzz>
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
