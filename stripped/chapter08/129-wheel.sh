bsdtar -xvf /mnt/lfs/sources/wheel-0.43.0.tar.gz
cd /mnt/lfs/sources/wheel*
pip3 wheel -w dist --no-cache-dir --no-build-isolation --no-deps $PWD
pip3 install --no-index --find-links=dist wheel
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
