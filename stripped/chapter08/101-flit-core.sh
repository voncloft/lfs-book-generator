#https://www.linuxfromscratch.org/~thomas/multilib/chapter08/flit-core.html
bsdtar -xvf /mnt/lfs/sources/flit_core-3.9.0.tar.gz
cd /mnt/lfs/sources/flit*
pip3 wheel -w dist --no-cache-dir --no-build-isolation --no-deps $PWD
pip3 install --no-index --no-user --find-links dist flit_core
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
