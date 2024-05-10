#https://www.linuxfromscratch.org/~thomas/multilib/partintro/generalinstructions.html
echo $LFS
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
