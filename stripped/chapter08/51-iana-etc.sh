#https://www.linuxfromscratch.org/~thomas/multilib/chapter08/iana-etc.html
bsdtar -xvf /mnt/lfs/sources/iana-etc-20240412.tar.gz
cd /mnt/lfs/sources/iana*
cp services protocols /etc
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
