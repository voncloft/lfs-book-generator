#https://www.linuxfromscratch.org/~thomas/multilib/chapter07/changingowner.html
chown --from lfs -R root:root $LFS/{usr,lib,var,etc,bin,sbin,tools}
case $(uname -m) in
  x86_64) chown --from lfs -R root:root $LFS/lib64 ;;
esac
chown -R root:root $LFS/lib32
chown -R root:root $LFS/libx32
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
