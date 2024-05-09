cd /mnt/lfs/sources/cleanup*
rm -rf /usr/share/{info,man,doc}/*
find /usr/{lib,libexec} -name \*.la -delete

find /usr/lib{,x}32 -name \*.la -delete
rm -rf /tools
exit
mountpoint -q $LFS/dev/shm  umount $LFS/dev/shm
umount $LFS/dev/pts
umount $LFS/{sys,proc,run,dev}
cd $LFS
tar -cJpf $HOME/lfs-temp-tools-r12.0-947.tar.xz .
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
