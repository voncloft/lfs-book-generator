bsdtar -xvf /mnt/lfs/sources/kmod-32.tar.xz
cd /mnt/lfs/sources/kmod*
./configure --prefix=/usr          \
            --sysconfdir=/etc      \
            --with-openssl         \
            --with-xz              \
            --with-zstd            \
            --with-zlib
make
make install

for target in depmod insmod modinfo modprobe rmmod; do
  ln -sfv ../bin/kmod /usr/sbin/$target
  rm -fv /usr/bin/$target
done
sed -e "s/^CLEANFILES =.*/CLEANFILES =/" -i man/Makefile
make clean
CC="gcc -m32" ./configure \
    --host=i686-pc-linux-gnu      \
    --prefix=/usr                 \
    --libdir=/usr/lib32           \
    --sysconfdir=/etc             \
    --with-openssl                \
    --with-xz                     \
    --with-zstd                   \
    --with-zlib                   \
    --with-rootlibdir=/usr/lib32
make
make DESTDIR=$PWD/DESTDIR install
cp -Rv DESTDIR/usr/lib32/* /usr/lib32
rm -rf DESTDIR
sed -e "s/^CLEANFILES =.*/CLEANFILES =/" -i man/Makefile
make clean
CC="gcc -mx32" ./configure \
    --host=x86_64-pc-linux-gnux32 \
    --prefix=/usr                 \
    --libdir=/usr/libx32          \
    --sysconfdir=/etc             \
    --with-openssl                \
    --with-xz                     \
    --with-zstd                   \
    --with-zlib                   \
    --with-rootlibdir=/usr/libx32
make
make DESTDIR=$PWD/DESTDIR install
cp -Rv DESTDIR/usr/libx32/* /usr/libx32
rm -rf DESTDIR
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
