<ll>
en
<CC>
GB
<charmap>
@euro
locale -a
ISO-8859-1
iso8859-1
iso88591
UTF-8
UTF-8
utf8
<locale name>
en_GB.iso88591
LC_ALL=
<locale name>
 locale charmap
en_GB.iso88591
en_GB.ISO-8859-1
LC_ALL=<locale name> locale language
LC_ALL=<locale name> locale charmap
LC_ALL=<locale name> locale int_curr_symbol
LC_ALL=<locale name> locale int_prefix
C.UTF-8
cat > /etc/profile << "EOF"

# Begin /etc/profile

for i in $(locale); do
  unset ${i%=*}
done

if [[ "$TERM" = linux ]]; then
  export LANG=C.UTF-8
else
  export LANG=
<ll>_<CC>.<charmap><@modifiers>

fi

# End /etc/profile

EOF
C
en_US
C
C
