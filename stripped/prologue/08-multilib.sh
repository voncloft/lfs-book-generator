echo 'int main(){}' > dummy.c
gcc -m32 dummy.c
./a.out

gcc -mx32 dummy.c
./a.out
