#https://www.linuxfromscratch.org/~thomas/multilib/chapter08/expect.html
bsdtar -xvf /mnt/lfs/sources/expect5.45.4.tar.gz
cd /mnt/lfs/sources/expect*
python3 -c 'from pty import spawn; spawn(["echo", "ok"])'
./configure --prefix=/usr           \
            --with-tcl=/usr/lib     \
            --enable-shared         \
            --mandir=/usr/share/man \
            --with-tclinclude=/usr/include
make
make test
make install
ln -svf expect5.45.4/libexpect5.45.4.so /usr/lib
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
