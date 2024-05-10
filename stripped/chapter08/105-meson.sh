#https://www.linuxfromscratch.org/~thomas/multilib/chapter08/meson.html
bsdtar -xvf /mnt/lfs/sources/meson-1.4.0.tar.gz
cd /mnt/lfs/sources/meson*
pip3 wheel -w dist --no-cache-dir --no-build-isolation --no-deps $PWD
pip3 install --no-index --find-links dist meson
install -vDm644 data/shell-completions/bash/meson /usr/share/bash-completion/completions/meson
install -vDm644 data/shell-completions/zsh/_meson /usr/share/zsh/site-functions/_meson
find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
