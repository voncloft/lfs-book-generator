rm -rf /tmp/*
find /usr/lib /usr/libexec -name \*.la -delete

find /usr/lib32 -name \*.la -delete

find /usr/libx32 -name \*.la -delete
find /usr -depth -name $(uname -m)-lfs-linux-gnu\* | xargs rm -rf
userdel -r tester
