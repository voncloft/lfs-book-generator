bsdtar -xvf /mnt/lfs/sources/grep-3.11.tar.xz
cd /mnt/lfs/sources/grep*
sed -i "s/echo/#echo/" src/egrep.sh
./configure --prefix=/usr
make
make check
make install
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
