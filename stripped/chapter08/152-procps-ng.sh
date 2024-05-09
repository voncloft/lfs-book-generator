bsdtar -xvf /mnt/lfs/sources/procps-ng-4.0.4.tar.xz
cd /mnt/lfs/sources/procps*
./configure --prefix=/usr                           \
            --docdir=/usr/share/doc/procps-ng-4.0.4 \
            --disable-static                        \
            --disable-kill
make
chown -R tester .
su tester -c "PATH=$PATH make check"
ps with output flag
          bsdtime,cputime,etime,etimes
CONFIG_BSD_PROCESS_ACCT
make install
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
