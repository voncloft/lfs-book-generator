#https://www.linuxfromscratch.org/~thomas/multilib/chapter10/grub.html
bsdtar -xvf /mnt/lfs/sources/grub-2.12.tar.xz
cd /mnt/lfs/sources/grub*
cd /tmp
grub-mkrescue --output=grub-img.iso
xorriso -as cdrecord -v dev=/dev/cdrw blank=as_needed grub-img.iso
grub-install /dev/sda
cat > /boot/grub/grub.cfg << "EOF"

# Begin /boot/grub/grub.cfg
set default=0
set timeout=5

insmod part_gpt
insmod ext2
set root=(hd0,2)

menuentry "GNU/Linux, Linux 6.8.8-lfs-r12.0-948" {
        linux   /boot/vmlinuz-6.8.8-lfs-r12.0-948 root=/dev/sda2 ro
}

EOF
UUID
PARTUUID
set root=(hdx,y)
search --set=root --fs-uuid 
<UUID of the filesystem where the kernel
            is installed>
root=/dev/sda2
root=PARTUUID=
<UUID of
            the partition where LFS is built>
root=UUID=
<filesystem
            UUID>
root=PARTUUID=
<partition UUID>
/dev/sda1
PARTUUID=
<partition UUID>
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
