#https://www.linuxfromscratch.org/~thomas/multilib/chapter08/intltool.html
bsdtar -xvf /mnt/lfs/sources/intltool-0.51.0.tar.gz
cd /mnt/lfs/sources/intltool*
sed -i 's:\\\${:\\\$\\{:' intltool-update.in
./configure --prefix=/usr
make
make check
make install
install -v -Dm644 doc/I18N-HOWTO /usr/share/doc/intltool-0.51.0/I18N-HOWTO
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
