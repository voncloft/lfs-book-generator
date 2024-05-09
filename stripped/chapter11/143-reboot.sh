cd /mnt/lfs/sources/reboot*
logout
umount -v $LFS/dev/pts
mountpoint -q $LFS/dev/shm  umount -v $LFS/dev/shm
umount -v $LFS/dev
umount -v $LFS/run
umount -v $LFS/proc
umount -v $LFS/sys
umount -v $LFS/home
umount -v $LFS
umount -v $LFS
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
