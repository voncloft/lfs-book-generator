cd /mnt/lfs/sources/etcshells*
cat > /etc/shells << "EOF"

# Begin /etc/shells

/bin/sh
/bin/bash

# End /etc/shells

EOF
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
