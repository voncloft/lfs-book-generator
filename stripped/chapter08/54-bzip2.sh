bsdtar -xvf /mnt/lfs/sources/bzip2-1.0.8.tar.gz
cd /mnt/lfs/sources/bzip2*
patch -Np1 -i ../bzip2-1.0.8-install_docs-1.patch
sed -i 's@\(ln -s -f \)$(PREFIX)/bin/@\1@' Makefile
sed -i "s@(PREFIX)/man@(PREFIX)/share/man@g" Makefile
make -f Makefile-libbz2_so
make clean
make
make PREFIX=/usr install
cp -av libbz2.so.* /usr/lib
ln -sv libbz2.so.1.0.8 /usr/lib/libbz2.so
cp -v bzip2-shared /usr/bin/bzip2
for i in /usr/bin/{bzcat,bunzip2}; do
  ln -sfv bzip2 $i
done
rm -fv /usr/lib/libbz2.a
make clean
sed -e "s/^CC=.*/CC=gcc -m32/" -i Makefile{,-libbz2_so}
make -f Makefile-libbz2_so
make libbz2.a
install -Dm755 libbz2.so.1.0.8 /usr/lib32/libbz2.so.1.0.8
ln -sf libbz2.so.1.0.8 /usr/lib32/libbz2.so
ln -sf libbz2.so.1.0.8 /usr/lib32/libbz2.so.1
ln -sf libbz2.so.1.0.8 /usr/lib32/libbz2.so.1.0
install -Dm644 libbz2.a /usr/lib32/libbz2.a
make clean
sed -e "s/^CC=.*/CC=gcc -mx32/" -i Makefile{,-libbz2_so}
make -f Makefile-libbz2_so
make libbz2.a
install -Dm755 libbz2.so.1.0.8 /usr/libx32/libbz2.so.1.0.8
ln -sf libbz2.so.1.0.8 /usr/libx32/libbz2.so
ln -sf libbz2.so.1.0.8 /usr/libx32/libbz2.so.1
ln -sf libbz2.so.1.0.8 /usr/libx32/libbz2.so.1.0
install -Dm644 libbz2.a /usr/libx32/libbz2.a
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
