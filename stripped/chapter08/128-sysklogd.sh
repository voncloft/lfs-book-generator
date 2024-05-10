#https://www.linuxfromscratch.org/~thomas/multilib/chapter08/sysklogd.html
bsdtar -xvf /mnt/lfs/sources/sysklogd-1.5.1.tar.gz
cd /mnt/lfs/sources/sysklogd*
sed -i '/Error loading kernel symbols/{n;n;d}' ksym_mod.c
sed -i 's/union wait/int/' syslogd.c
make
make install
cat > /etc/syslog.conf << "EOF"

# Begin /etc/syslog.conf

auth,authpriv.* -/var/log/auth.log
*.*;auth,authpriv.none -/var/log/sys.log
daemon.* -/var/log/daemon.log
kern.* -/var/log/kern.log
mail.* -/var/log/mail.log
user.* -/var/log/user.log
*.emerg *

# End /etc/syslog.conf

EOF
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
