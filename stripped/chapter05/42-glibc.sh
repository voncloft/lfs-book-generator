source ~/.bash_profile
cd /mnt/lfs/sources/glibc*
ln -sfv ../lib/ld-linux-x86-64.so.2 $LFS/lib64
ln -sfv ../lib/ld-linux-x86-64.so.2 $LFS/lib64/ld-lsb-x86-64.so.3
patch -Np1 -i ../glibc-2.39-fhs-1.patch
mkdir -v build
cd       build
echo "rootsbindir=/usr/sbin" > configparms
../configure                             \
      --prefix=/usr                      \
      --host=$LFS_TGT                    \
      --build=$(../scripts/config.guess) \
      --enable-kernel=4.19                \
      --with-headers=$LFS/usr/include    \
      --enable-multi-arch                \
      libc_cv_slibdir=/usr/lib
make
make DESTDIR=$LFS install
sed '/RTLDLIST=/s@/usr@@g' -i $LFS/usr/bin/ldd
echo 'int main(){}' | $LFS_TGT-gcc -xc -
readelf -l a.out | grep ld-linux
rm -v a.out
make clean
find .. -name "*.a" -delete
CC="$LFS_TGT-gcc -m32" \
CXX="$LFS_TGT-g++ -m32" \
../configure                             \
      --prefix=/usr                      \
      --host=$LFS_TGT32                  \
      --build=$(../scripts/config.guess) \
      --enable-kernel=4.19                \
      --with-headers=$LFS/usr/include    \
      --enable-multi-arch                \
      --libdir=/usr/lib32                \
      --libexecdir=/usr/lib32            \
      libc_cv_slibdir=/usr/lib32
make
make DESTDIR=$PWD/DESTDIR install
cp -a DESTDIR/usr/lib32 $LFS/usr/
install -vm644 DESTDIR/usr/include/gnu/{lib-names,stubs}-32.h \
               $LFS/usr/include/gnu/
ln -svf ../lib32/ld-linux.so.2 $LFS/lib/ld-linux.so.2
echo 'int main(){}' > dummy.c
$LFS_TGT-gcc -m32 dummy.c
readelf -l a.out | grep '/ld-linux'
rm -v dummy.c a.out
make clean
find .. -name "*.a" -delete
CC="$LFS_TGT-gcc -mx32" \
CXX="$LFS_TGT-g++ -mx32" \
../configure                             \
      --prefix=/usr                      \
      --host=$LFS_TGTX32                 \
      --build=$(../scripts/config.guess) \
      --enable-kernel=4.19                \
      --with-headers=$LFS/usr/include    \
      --enable-multi-arch                \
      --libdir=/usr/libx32               \
      --libexecdir=/usr/libx32           \
      libc_cv_slibdir=/usr/libx32
make
make DESTDIR=$PWD/DESTDIR install
cp -a DESTDIR/usr/libx32 $LFS/usr/
install -vm644 DESTDIR/usr/include/gnu/{lib-names,stubs}-x32.h \
               $LFS/usr/include/gnu/
ln -svf ../libx32/ld-linux-x32.so.2 $LFS/lib/ld-linux-x32.so.2
echo 'int main(){}' > dummy.c
$LFS_TGT-gcc -mx32 dummy.c
readelf -l a.out | grep '/ld-linux-x32'
rm -v dummy.c a.out
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
