#https://www.linuxfromscratch.org/~thomas/multilib/chapter08/isl.html
bsdtar -xvf /mnt/lfs/sources/isl-0.26.tar.xz
cd /mnt/lfs/sources/isl*
./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/isl-0.26
make
make install
install -vd /usr/share/doc/isl-0.26
install -m644 doc/{CodingStyle,manual.pdf,SubmittingPatches,user.pod} \
        /usr/share/doc/isl-0.26
mkdir -pv /usr/share/gdb/auto-load/usr/lib
mv -v /usr/lib/libisl*gdb.py /usr/share/gdb/auto-load/usr/lib
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
