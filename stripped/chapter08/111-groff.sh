#https://www.linuxfromscratch.org/~thomas/multilib/chapter08/groff.html
bsdtar -xvf /mnt/lfs/sources/groff-1.23.0.tar.gz
cd /mnt/lfs/sources/groff*
PAGE=
<paper_size>
 ./configure --prefix=/usr
make
make check
make install
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
