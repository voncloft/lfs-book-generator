#https://www.linuxfromscratch.org/~thomas/multilib/chapter09/network.html
cd /etc/sysconfig/
cat > ifconfig.
eth0
 << "EOF"

ONBOOT=
yes

IFACE=
eth0

SERVICE=
ipv4-static

IP=
192.168.1.2

GATEWAY=
192.168.1.1

PREFIX=
24

BROADCAST=
192.168.1.255

EOF
yes
yes
cat > /etc/resolv.conf << "EOF"

# Begin /etc/resolv.conf

domain 
<Your Domain Name>

nameserver 
<IP address of your primary nameserver>

nameserver 
<IP address of your secondary nameserver>


# End /etc/resolv.conf

EOF
<IP address of the
          nameserver>
echo "
<lfs>
" > /etc/hostname
<lfs>
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
<FQDN>
 
<HOSTNAME>


<192.168.1.1>
 
<FQDN>
 
<HOSTNAME>
 
[alias1] [alias2 ...]

::1       localhost ip6-localhost ip6-loopback
ff02::1   ip6-allnodes
ff02::2   ip6-allrouters

# End /etc/hosts

EOF
<192.168.1.1>
<FQDN>
<HOSTNAME>
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
