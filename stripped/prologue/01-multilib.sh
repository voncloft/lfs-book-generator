#https://www.linuxfromscratch.org/~thomas/multilib/prologue/multilib.html
echo 'int main(){}' > dummy.c
gcc -m32 dummy.c
./a.out

gcc -mx32 dummy.c
./a.out
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
