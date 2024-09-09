# Symlink dotConfig
ln -s "$PWD"/symlink-to-dotConfig/* ~/.config/

# Install fish
# sudo dnf install fish
sudo pacman -S --needed fish
sudo pacman -S --needed --asdeps pkgfile
sudo systemctl enable --now pkgfile-update.timer

# Symlink .bashrc
mv ~/.bashrc ~/.bashrc.old
ln -s "$PWD"/symlink-to-home-folder/.bashrc ~/
ln -s "$PWD"/symlink-to-home-folder/.gitconfig ~/
