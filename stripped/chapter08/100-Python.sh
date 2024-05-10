#https://www.linuxfromscratch.org/~thomas/multilib/chapter08/Python.html
bsdtar -xvf /mnt/lfs/sources/Python-3.12.3.tar.xz
cd /mnt/lfs/sources/Python*
./configure --prefix=/usr        \
            --enable-shared      \
            --with-system-expat  \
            --enable-optimizations
make
make test TESTOPTS="--timeout 120"
make install
cat > /etc/pip.conf << EOF

[global]
root-user-action = ignore
disable-pip-version-check = true

EOF

install -v -dm755 /usr/share/doc/python-3.12.3/html

tar --no-same-owner \
    -xvf ../python-3.12.3-docs-html.tar.bz2
cp -R --no-preserve=mode python-3.12.3-docs-html/* \
    /usr/share/doc/python-3.12.3/html
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
