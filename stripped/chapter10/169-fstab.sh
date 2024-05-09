cd /mnt/lfs/sources/fstab*
cat > /etc/fstab << "EOF"

# Begin /etc/fstab

# file system  mount-point    type     options             dump  fsck
#                                                                order

/dev/
<xxx>
     /              
<fff>
    defaults            1     1
/dev/
<yyy>
     swap           swap     pri=1               0     0
proc           /proc          proc     nosuid,noexec,nodev 0     0
sysfs          /sys           sysfs    nosuid,noexec,nodev 0     0
devpts         /dev/pts       devpts   gid=5,mode=620      0     0
tmpfs          /run           tmpfs    defaults            0     0
devtmpfs       /dev           devtmpfs mode=0755,nosuid    0     0
tmpfs          /dev/shm       tmpfs    nosuid,nodev        0     0
cgroup2        /sys/fs/cgroup cgroup2  nosuid,noexec,nodev 0     0

# End /etc/fstab

EOF
<xxx>
<yyy>
<fff>
noauto,user,quiet,showexec,codepage=866,iocharset=koi8r
noauto,user,quiet,showexec,codepage=866,utf8
iso8859-1
hdparm -I /dev/sda | grep NCQ
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
