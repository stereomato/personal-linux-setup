#!/usr/bin/env fish
# This just copies all the files.
# Basically an Arch Linux *system* setup script, kinda.

# boot options
sudo echo -n zswap.enabled=N snd_hda_intel.power_save=3 iwlwifi.power_save=Y iwlwifi.power_level=3 i915.enable_guc=2 i915.enable_psr=1 i915.enable_psr2_sel_fetch=1 | sudo tee -a /boot/loader/entries/zen-kernel.conf

# FIXME: this...
 echo "Merge the last 2 lines together."

# pager
sudo pacman -S less

# pacman.conf
sudo mv /etc/pacman.conf /etc/pacman.conf.original
sudo cp -aZ pacman.conf /etc/pacman.conf
sudo pacman -Sy

# intel audio
sudo pacman -S sof-firmware

# intel hardware media accel
sudo pacman -S intel-media-driver

# thermald
sudo pacman -S thermald
sudo systemctl enable --now thermald

# dnf mirror slowness fix

# sudo echo "0.0.0.0		fedora.c3sl.ufpr.br" | sudo tee -a /etc/hosts
# sudo echo "0.0.0.0		mirror.cedia.org.ec" | sudo tee -a /etc/hosts

# sysctl
sudo cp -aZ sysctl.conf /etc/sysctl.d/stereomato-sysctl.conf
sudo sysctl --system

# zram
sudo cp -aZ zram-generator.conf /etc/systemd/zram-generator.conf
sudo pacman -S zram-generator

# tmpfiles
sudo cp -aZ tmpfiles.conf /etc/tmpfiles.d/stereomato-tmpfiles.conf

# powertop service
sudo cp -aZ powertop.service /etc/systemd/system/
sudo pacman -S powertop
#sudo dnf install powertop
sudo systemctl daemon-reload

# sudo dnf install powertop
sudo systemctl enable --now powertop

# makepkg.conf
sudo mv /etc/makepkg.conf /etc/makepkg.conf.original
sudo cp -aZ makepkg.conf /etc/makepkg.conf
sudo pacman -S pigz pbzip2

# font configuration
sudo ln -s /usr/share/fontconfig/conf.avail/10-unhinted.conf /etc/fonts/conf.d/
sudo ln -s /usr/share/fontconfig/conf.avail/10-hinting-none.conf /etc/fonts/conf.d/
sudo ln -s /usr/share/fontconfig/conf.avail/10-sub-pixel-none.conf /etc/fonts/conf.d/

# fill it with firefox, fish, etc

# power-profiles-daemon
sudo pacman -S --asdeps power-profiles-daemon

# aur stuff
sudo pacman -S base-devel vifm bat devtools

# Qadwaitadecorations
paru -S qt5-adwaitadecorations qt6-adwaitadecorations qt5-wayland-decorations

# optimize-media
sudo pacman -S mkvtoolnix-cli mediainfo wavpack libavif
