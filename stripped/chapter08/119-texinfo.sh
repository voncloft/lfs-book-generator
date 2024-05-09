bsdtar -xvf /mnt/lfs/sources/texinfo-7.1.tar.xz
cd /mnt/lfs/sources/texinfo*
./configure --prefix=/usr
make
make check
make install
make TEXMF=/usr/share/texmf install-tex
pushd /usr/share/info
  rm -v dir
  for f in *
    do install-info $f dir 2>/dev/null
  done
popd
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
