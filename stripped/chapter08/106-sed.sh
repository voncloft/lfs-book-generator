bsdtar -xvf /mnt/lfs/sources/sed-4.9.tar.xz
cd /mnt/lfs/sources/sed*
./configure --prefix=/usr
make
make html
chown -R tester .
su tester -c "PATH=$PATH make check"
make install
install -d -m755           /usr/share/doc/sed-4.9
install -m644 doc/sed.html /usr/share/doc/sed-4.9
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
