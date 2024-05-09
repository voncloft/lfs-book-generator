bsdtar -xvf /mnt/lfs/sources/util-linux-2.40.tar.xz
cd /mnt/lfs/sources/util*
./configure --bindir=/usr/bin     \
            --libdir=/usr/lib     \
            --runstatedir=/run    \
            --sbindir=/usr/sbin   \
            --disable-chfn-chsh   \
            --disable-login       \
            --disable-nologin     \
            --disable-su          \
            --disable-setpriv     \
            --disable-runuser     \
            --disable-pylibmount  \
            --disable-liblastlog2 \
            --disable-static      \
            --without-python      \
            --without-systemd     \
            --without-systemdsystemunitdir        \
            ADJTIME_PATH=/var/lib/hwclock/adjtime \
            --docdir=/usr/share/doc/util-linux-2.40
make
bash tests/run.sh --srcdir=$PWD --builddir=$PWD
touch /etc/fstab
chown -R tester .
su tester -c "make -k check"
make install
make distclean
mv /usr/bin/ncursesw6-config{,.tmp}
CC="gcc -m32" \
./configure ADJTIME_PATH=/var/lib/hwclock/adjtime   \
            --host=i686-pc-linux-gnu \
            --libdir=/usr/lib32      \
            --runstatedir=/run       \
            --sbindir=/usr/sbin      \
            --docdir=/usr/share/doc/util-linux-2.40 \
            --disable-chfn-chsh      \
            --disable-login          \
            --disable-nologin        \
            --disable-su             \
            --disable-setpriv        \
            --disable-runuser        \
            --disable-pylibmount     \
            --disable-liblastlog2    \
            --disable-static         \
            --without-python         \
            --without-systemd        \
            --without-systemdsystemunitdir
mv /usr/bin/ncursesw6-config{.tmp,}
make
make DESTDIR=$PWD/DESTDIR install
cp -Rv DESTDIR/usr/lib32/* /usr/lib32
rm -rf DESTDIR
make distclean
mv /usr/bin/ncursesw6-config{,.tmp}
CC="gcc -mx32" \
./configure ADJTIME_PATH=/var/lib/hwclock/adjtime   \
            --host=x86_64-pc-linux-gnux32 \
            --libdir=/usr/libx32  \
            --runstatedir=/run    \
            --sbindir=/usr/sbin   \
            --docdir=/usr/share/doc/util-linux-2.40 \
            --disable-chfn-chsh   \
            --disable-login       \
            --disable-nologin     \
            --disable-su          \
            --disable-setpriv     \
            --disable-runuser     \
            --disable-pylibmount  \
            --disable-liblastlog2 \
            --disable-static      \
            --without-python      \
            --without-systemd     \
            --without-systemdsystemunitdir
mv /usr/bin/ncursesw6-config{.tmp,}
make
make DESTDIR=$PWD/DESTDIR install
cp -Rv DESTDIR/usr/libx32/* /usr/libx32
rm -rf DESTDIR
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
