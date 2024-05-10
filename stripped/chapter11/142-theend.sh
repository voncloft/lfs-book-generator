#https://www.linuxfromscratch.org/~thomas/multilib/chapter11/theend.html
echo r12.0-948 > /etc/lfs-release
cat > /etc/lsb-release << "EOF"
DISTRIB_ID="Linux From Scratch"
DISTRIB_RELEASE="r12.0-948"
DISTRIB_CODENAME="<your name here>"
DISTRIB_DESCRIPTION="Linux From Scratch"
EOF
cat > /etc/os-release << "EOF"
NAME="Linux From Scratch"
VERSION="r12.0-948"
ID=lfs
PRETTY_NAME="Linux From Scratch r12.0-948"
VERSION_CODENAME="<your name here>"
HOME_URL="https://www.linuxfromscratch.org/lfs/"
EOF
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
