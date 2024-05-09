mkdir -pv $LFS/{etc,var} $LFS/usr/{bin,lib,sbin}

for i in bin lib sbin; do
  ln -sv usr/$i $LFS/$i
done

case $(uname -m) in
  x86_64) mkdir -pv $LFS/lib64 ;;
esac
mkdir -pv $LFS/usr/lib{,x}32
ln -sv usr/lib32 $LFS/lib32
ln -sv usr/libx32 $LFS/libx32
mkdir -pv $LFS/tools
