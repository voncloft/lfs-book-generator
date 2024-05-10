#https://www.linuxfromscratch.org/~thomas/multilib/chapter08/make.html
bsdtar -xvf /mnt/lfs/sources/make-4.4.1.tar.gz
cd /mnt/lfs/sources/make*
./configure --prefix=/usr
make
chown -R tester .
su tester -c "PATH=$PATH make check"
make install
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
