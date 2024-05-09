bsdtar -xvf /mnt/lfs/sources/check-0.15.2.tar.gz
cd /mnt/lfs/sources/check*
./configure --prefix=/usr --disable-static
make
make check
make docdir=/usr/share/doc/check-0.15.2 install
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
