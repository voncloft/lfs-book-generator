make mrproper
make menuconfig
<host_LANG_value>
make
make modules_install
mount /boot
cp -iv arch/x86/boot/bzImage /boot/vmlinuz-6.8.8-lfs-r12.0-947
cp -iv System.map /boot/System.map-6.8.8
cp -iv .config /boot/config-6.8.8
cp -r Documentation -T /usr/share/doc/linux-6.8.8
install -v -m755 -d /etc/modprobe.d
cat > /etc/modprobe.d/usb.conf << "EOF"

# Begin /etc/modprobe.d/usb.conf

install ohci_hcd /sbin/modprobe ehci_hcd ; /sbin/modprobe -i ohci_hcd ; true
install uhci_hcd /sbin/modprobe ehci_hcd ; /sbin/modprobe -i uhci_hcd ; true

# End /etc/modprobe.d/usb.conf

EOF
