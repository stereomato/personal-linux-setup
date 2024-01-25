#!/usr/bin/env fish

# sysctl
sudo cp -aZ sysctl.conf /etc/sysctl.d/stereomato-sysctl.conf

# powertop
# sudo cp -aZ powertop.service /etc/systemd/system/

# zram
sudo cp -aZ zram-generator.conf /etc/systemd/

# tmpfiles
sudo cp -aZ tmpfiles.conf /etc/tmpfiles.d/stereomato-tmpfiles.conf

# pacman.conf
sudo cp -aZ pacman.conf /etc/

# makepkg.conf
sudo cp -aZ makepkg.conf /etc/