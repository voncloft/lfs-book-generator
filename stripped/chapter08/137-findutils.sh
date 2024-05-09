bsdtar -xvf /mnt/lfs/sources/findutils-4.9.0.tar.xz
cd /mnt/lfs/sources/findutils*
./configure --prefix=/usr --localstatedir=/var/lib/locate
make
chown -R tester .
su tester -c "PATH=$PATH make check"
make install
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
