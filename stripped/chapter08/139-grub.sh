bsdtar -xvf /mnt/lfs/sources/grub-2.12.tar.xz
cd /mnt/lfs/sources/grub*
unset {C,CPP,CXX,LD}FLAGS
echo 
depends bli part_gpt
 > grub-core/extra_deps.lst
./configure --prefix=/usr          \
            --sysconfdir=/etc      \
            --disable-efiemu       \
            --disable-werror
make
make install
mv -v /etc/bash_completion.d/grub /usr/share/bash-completion/completions
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
