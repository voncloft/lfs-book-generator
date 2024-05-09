bsdtar -xvf /mnt/lfs/sources/openssl-3.3.0.tar.gz
cd /mnt/lfs/sources/openssl*
./config --prefix=/usr         \
         --openssldir=/etc/ssl \
         --libdir=lib          \
         shared                \
         zlib-dynamic
make
HARNESS_JOBS=
$(nproc)
 make test
sed -i '/INSTALL_LIBS/s/libcrypto.a libssl.a//' Makefile
make MANSUFFIX=ssl install
mv -v /usr/share/doc/openssl /usr/share/doc/openssl-3.3.0
cp -vfr doc/* /usr/share/doc/openssl-3.3.0
make distclean
./config --prefix=/usr         \
         --openssldir=/etc/ssl \
         --libdir=lib32        \
         shared                \
         zlib-dynamic          \
         linux-x86
make
make DESTDIR=$PWD/DESTDIR install
cp -Rv DESTDIR/usr/lib32/* /usr/lib32
rm -rf DESTDIR
make distclean
./config --prefix=/usr         \
         --openssldir=/etc/ssl \
         --libdir=libx32       \
         shared                \
         zlib-dynamic          \
         linux-x32
make
make DESTDIR=$PWD/DESTDIR install
cp -Rv DESTDIR/usr/libx32/* /usr/libx32
rm -rf DESTDIR
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
