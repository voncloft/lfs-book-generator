bsdtar -xvf /mnt/lfs/sources/gettext-0.22.5.tar.xz
cd /mnt/lfs/sources/gettext*
./configure --disable-shared
make
cp -v gettext-tools/src/{msgfmt,msgmerge,xgettext} /usr/bin
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
