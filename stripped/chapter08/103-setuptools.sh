bsdtar -xvf /mnt/lfs/sources/setuptools-69.5.1.tar.gz
cd /mnt/lfs/sources/setuptools*
pip3 wheel -w dist --no-cache-dir --no-build-isolation --no-deps $PWD
pip3 install --no-index --find-links dist setuptools
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
