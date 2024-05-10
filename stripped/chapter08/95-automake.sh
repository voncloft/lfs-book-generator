#https://www.linuxfromscratch.org/~thomas/multilib/chapter08/automake.html
bsdtar -xvf /mnt/lfs/sources/automake-1.16.5.tar.xz
cd /mnt/lfs/sources/automake*
./configure --prefix=/usr --docdir=/usr/share/doc/automake-1.16.5
make
make 
-j$(($(nproc)>4?$(nproc):4))
 check
$((...))
make install
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
