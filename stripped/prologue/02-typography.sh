#https://www.linuxfromscratch.org/~thomas/multilib/prologue/typography.html
./configure --prefix=/usr
CC="gcc -B/usr/bin/" ../binutils-2.18/configure \
  --prefix=/tools --disable-nls --disable-werror
Il1
O0
cat > $LFS/etc/group << "EOF"

root:x:0:
bin:x:1:
......

EOF
<REPLACED TEXT>
[OPTIONAL TEXT]
<program
        name>
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
