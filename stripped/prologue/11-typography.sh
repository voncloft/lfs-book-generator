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
