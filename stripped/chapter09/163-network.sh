cd /etc/sysconfig/
cat > ifconfig.
 << "EOF"

ONBOOT=

IFACE=

SERVICE=

IP=

GATEWAY=

PREFIX=

BROADCAST=

EOF
yes
yes
cat > /etc/resolv.conf << "EOF"

# Begin /etc/resolv.conf

domain 

nameserver 

nameserver 


# End /etc/resolv.conf

EOF
echo "
" > /etc/hostname
IP_address myhost.example.org aliases
Private Network Address Range      Normal Prefix
10.0.0.1 - 10.255.255.254           8
172.x.0.1 - 172.x.255.254           16
192.168.y.1 - 192.168.y.254         24
localhost.localdomain
cat > /etc/hosts << "EOF"

# Begin /etc/hosts

127.0.0.1 localhost.localdomain localhost
127.0.1.1 
 


 
 
 

::1       localhost ip6-localhost ip6-loopback
ff02::1   ip6-allnodes
ff02::2   ip6-allrouters

# End /etc/hosts

EOF
