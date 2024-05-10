#https://www.linuxfromscratch.org/~thomas/multilib/chapter06/ncurses.html
source ~/.bash_profile
bsdtar -xvf /mnt/lfs/sources/ncurses-6.5.tar.gz
cd /mnt/lfs/sources/ncurses*
sed -i s/mawk// configure
mkdir build
pushd build
  ../configure
  make -C include
  make -C progs tic
popd
./configure --prefix=/usr                \
            --host=$LFS_TGT              \
            --build=$(./config.guess)    \
            --mandir=/usr/share/man      \
            --with-manpage-format=normal \
            --with-shared                \
            --without-normal             \
            --with-cxx-shared            \
            --without-debug              \
            --without-ada                \
            --disable-stripping
make
make DESTDIR=$LFS TIC_PATH=$(pwd)/build/progs/tic install
ln -sv libncursesw.so $LFS/usr/lib/libncurses.so
sed -e 's/^#if.*XOPEN.*$/#if 1/' \
    -i $LFS/usr/include/curses.h
make distclean
CC="$LFS_TGT-gcc -m32"              \
CXX="$LFS_TGT-g++ -m32"             \
./configure --prefix=/usr           \
            --host=$LFS_TGT32       \
            --build=$(./config.guess)    \
            --libdir=/usr/lib32     \
            --mandir=/usr/share/man \
            --with-shared           \
            --without-normal        \
            --with-cxx-shared       \
            --without-debug         \
            --without-ada           \
            --disable-stripping     \
            --enable-widec
make
make DESTDIR=$PWD/DESTDIR TIC_PATH=$(pwd)/build/progs/tic install
ln -s libncursesw.so DESTDIR/usr/lib32/libcursesw.so
cp -Rv DESTDIR/usr/lib32/* $LFS/usr/lib32
rm -rf DESTDIR
make distclean
CC="$LFS_TGT-gcc -mx32"             \
CXX="$LFS_TGT-g++ -mx32"            \
./configure --prefix=/usr           \
            --host=$LFS_TGTX32      \
            --build=$(./config.guess)    \
            --libdir=/usr/libx32    \
            --mandir=/usr/share/man \
            --with-shared           \
            --without-normal        \
            --with-cxx-shared       \
            --without-debug         \
            --without-ada           \
            --disable-stripping     \
            --enable-widec
make
make DESTDIR=$PWD/DESTDIR TIC_PATH=$(pwd)/build/progs/tic install
ln -s libncursesw.so DESTDIR/usr/libx32/libcursesw.so
cp -Rv DESTDIR/usr/libx32/* $LFS/usr/libx32
rm -rf DESTDIR
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
