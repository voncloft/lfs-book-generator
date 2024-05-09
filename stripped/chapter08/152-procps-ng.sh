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
