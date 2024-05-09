cd /mnt/lfs/sources/chroot*
chroot "$LFS" /usr/bin/env -i   \
    HOME=/root                  \
    TERM="$TERM"                \
    PS1='(lfs chroot) \u:\w\$ ' \
    PATH=/usr/bin:/usr/sbin     \
    MAKEFLAGS="-j
$(nproc)
"      \
    TESTSUITEFLAGS="-j
$(nproc)
" \
    /bin/bash --login
$(nproc)
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
