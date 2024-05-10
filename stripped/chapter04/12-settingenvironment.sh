#https://www.linuxfromscratch.org/~thomas/multilib/chapter04/settingenvironment.html
cat > ~/.bash_profile << "EOF"

exec env -i HOME=$HOME TERM=$TERM PS1='\u:\w\$ ' /bin/bash

EOF
cat > ~/.bashrc << "EOF"

set +h
umask 022
LFS=/mnt/lfs
LC_ALL=POSIX
LFS_TGT=x86_64-lfs-linux-gnu
LFS_TGT32=i686-lfs-linux-gnu
LFS_TGTX32=x86_64-lfs-linux-gnux32
PATH=/usr/bin
if [ ! -L /bin ]; then PATH=/bin:$PATH; fi
PATH=$LFS/tools/bin:$PATH
CONFIG_SITE=$LFS/usr/share/config.site
export LFS LC_ALL LFS_TGT LFS_TGT32 LFS_TGTX32 PATH

EOF
[ ! -e /etc/bash.bashrc ] || mv -v /etc/bash.bashrc /etc/bash.bashrc.NOUSE
make -j32
export MAKEFLAGS=-j32
cat >> ~/.bashrc << "EOF"

export MAKEFLAGS=-j$(nproc)

EOF
$(nproc)
source ~/.bash_profile
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
