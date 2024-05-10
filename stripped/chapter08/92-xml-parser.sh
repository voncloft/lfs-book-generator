#https://www.linuxfromscratch.org/~thomas/multilib/chapter08/xml-parser.html
perl Makefile.PL
make
make test
make install
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
