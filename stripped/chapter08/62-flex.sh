#https://www.linuxfromscratch.org/~thomas/multilib/chapter08/flex.html
bsdtar -xvf /mnt/lfs/sources/flex-2.6.4.tar.gz
cd /mnt/lfs/sources/flex*
./configure --prefix=/usr \
            --docdir=/usr/share/doc/flex-2.6.4 \
            --disable-static
make
make check
make install
ln -sv flex   /usr/bin/lex
ln -sv flex.1 /usr/share/man/man1/lex.1
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
