#!/usr/bin/env fish
# This just copies all the files.
# Basically an Arch Linux *system* setup script, kinda.

# boot options
sudo echo -n zswap.enabled=N snd_hda_intel.power_save=3 | sudo tee -a /boot/loader/entries/zen-kernel.conf
# iwlwifi.power_save=Y iwlwifi.power_level=3 i915.enable_guc=2

# FIXME: this...
echo "Merge the last 2 lines together."

# pager
sudo pacman -S less

# man
sudo pacman -S mandoc
# sudo zypper in mandoc

# pacman.conf
sudo mv /etc/pacman.conf /etc/pacman.conf.original
sudo cp -aZ pacman.conf /etc/pacman.conf
sudo pacman -Sy

# intel audio
sudo pacman -S --needed sof-firmware
#sudo zypper in sof-firmware
# intel hardware media accel
sudo pacman -S --needed intel-media-driver

# thermald
sudo pacman -S --needed thermald
#sudo zypper in thermald
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
#sudo zypper in zram-generator

# tmpfiles
sudo cp -aZ tmpfiles.conf /etc/tmpfiles.d/stereomato-tmpfiles.conf

# powertop service
sudo cp -aZ powertop.service /etc/systemd/system/
sudo pacman -S --needed powertop
# sudo dnf install powertop
sudo systemctl daemon-reload
# sudo zypper in powertop
sudo systemctl enable --now powertop

# makepkg.conf
sudo mv /etc/makepkg.conf /etc/makepkg.conf.original
sudo cp -aZ makepkg.conf /etc/makepkg.conf
sudo pacman -S --needed pigz pbzip2

# fast locate
sudo pacman -S --needed plocate

# font configuration
sudo ln -s /usr/share/fontconfig/conf.avail/10-unhinted.conf /etc/fonts/conf.d/
sudo ln -s /usr/share/fontconfig/conf.avail/10-hinting-none.conf /etc/fonts/conf.d/
sudo ln -s /usr/share/fontconfig/conf.avail/10-sub-pixel-none.conf /etc/fonts/conf.d/
sudo rm /etc/fonts/conf.d/10-hinting-slight.conf
sudo rm /etc/fonts/conf.d/11-lcdfilter-default.conf

# Breaks emoji fonts
# sudo ln -sf /usr/share/fontconfig/conf.avail/70-no-bitmaps.conf /etc/fonts/conf.d/

# fill it with firefox, fish, etc

# power-profiles-daemon
sudo pacman -S --asdeps power-profiles-daemon
# sudo zypper in power-profiles-daemon

# aur stuff
sudo pacman -S --needed base-devel vifm bat devtools

# Qadwaitadecorations
#paru -S qt5-adwaitadecorations qt6-adwaitadecorations qt5-wayland-decorations

# optimize-media
sudo pacman -S --needed mkvtoolnix-cli mediainfo wavpack libavif

# ignore suspend-on-lid-close when on ac
# sudo cp -aZ lid-suspend-ac-ignore.conf /etc/systemd/logind.conf.d/

# Pro audio
sudo pacman -S --needed realtime-privileges
sudo usermod -a -G realtime (whoami)
