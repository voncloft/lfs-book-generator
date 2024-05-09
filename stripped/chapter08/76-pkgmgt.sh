cd /mnt/lfs/sources/pkgmgt*
libfoo
grep -l '
libfoo
.*deleted' /proc/*/maps | tr -cd 0-9\\n | xargs -r ps u
./configure --prefix=/usr/pkg/libfoo/1.1
make
make install
./configure --prefix=/usr
make
make DESTDIR=/usr/pkg/libfoo/1.1 install
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
