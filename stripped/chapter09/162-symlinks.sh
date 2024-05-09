bash /usr/lib/udev/init-net-rules.sh
cat /etc/udev/rules.d/70-persistent-net.rules
SUBSYSTEM=="net"
ACTION=="add"
DRIVERS=="?*"
ATTR{address}
ATTR{type}=="1"
NAME
NAME
NAME
sed -e '/^AlternativeNamesPolicy/s/=.*$/=/'  \
    -i /usr/lib/udev/network/99-default.link \
     > /etc/udev/network/99-default.link
udevadm test /sys/block/hdd
sed -e 's/"write_cd_rules"/"write_cd_rules 
"/' \
    -i /etc/udev/rules.d/83-cdrom-symlinks.rules
udevadm info -a -p /sys/class/video4linux/video0
cat > /etc/udev/rules.d/83-duplicate_devs.rules << "EOF"


# Persistent symlinks for webcam and tuner
KERNEL=="video*", ATTRS{idProduct}=="1910", ATTRS{idVendor}=="0d81", SYMLINK+="webcam"
KERNEL=="video*", ATTRS{device}=="0x036f",  ATTRS{vendor}=="0x109e", SYMLINK+="tvtuner"


EOF
