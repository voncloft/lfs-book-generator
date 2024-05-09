cd /mnt/lfs/sources/xml*
perl Makefile.PL
make
make test
make install
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
