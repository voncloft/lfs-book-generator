#https://www.linuxfromscratch.org/~thomas/multilib/chapter08/libcap.html
bsdtar -xvf /mnt/lfs/sources/libcap-2.69.tar.xz
cd /mnt/lfs/sources/libcap*
sed -i '/install -m.*STA/d' libcap/Makefile
make prefix=/usr lib=lib
make test
make prefix=/usr lib=lib install
make distclean
make CC="gcc -m32 -march=i686"
make CC="gcc -m32 -march=i686" lib=lib32 prefix=$PWD/DESTDIR/usr -C libcap install
cp -Rv DESTDIR/usr/lib32/* /usr/lib32
sed -e "s|^libdir=.*|libdir=/usr/lib32|" -i /usr/lib32/pkgconfig/lib{cap,psx}.pc
chmod -v 755 /usr/lib32/libcap.so.2.69
rm -rf DESTDIR
make distclean
make CC="gcc -mx32 -march=x86-64"
make CC="gcc -mx32 -march=x86-64" lib=libx32 prefix=$PWD/DESTDIR/usr -C libcap install
cp -Rv DESTDIR/usr/libx32/* /usr/libx32
sed -e "s|^libdir=.*|libdir=/usr/libx32|" -i /usr/libx32/pkgconfig/lib{cap,psx}.pc
chmod -v 755 /usr/libx32/libcap.so.2.69
rm -rf DESTDIR
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
