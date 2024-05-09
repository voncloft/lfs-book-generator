mkdir -v $LFS/sources
chmod -v a+wt $LFS/sources
wget --input-file=wget-list-sysv --continue --directory-prefix=$LFS/sources
pushd $LFS/sources
  md5sum -c md5sums
popd
chown root:root $LFS/sources/*
