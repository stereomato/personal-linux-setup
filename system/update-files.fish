#!/usr/bin/env fish

# udev
sudo cp --preserve=mode 90-stereomato-udev.rules /etc/udev/rules.d/

# sysctl
sudo cp --preserve=mode sysctl.conf /etc/sysctl.d/stereomato-sysctl.conf

# powertop
sudo cp --preserve=mode powertop.service /etc/systemd/system/

# battery threshold
sudo cp --preserve=mode battery-charge-threshold.service /etc/systemd/system/

# zram
sudo cp --preserve=mode zram-generator.conf /etc/systemd/

# tmpfiles
sudo cp --preserve=mode tmpfiles.conf /etc/tmpfiles.d/stereomato-tmpfiles.conf

# pacman.conf
sudo cp --preserve=mode pacman.conf /etc/

# makepkg.conf
sudo cp --preserve=mode makepkg.conf /etc/

# intel_lpmd configuration
sudo cp --preserve=mode intel_lpmd_config.xml /etc/intel_lpmd/intel_lpmd_config.xml 

# zram configuration
sudo cp --preserve=mode zram-generator.conf /etc/systemd/
# sudo cp --preserve=mode zram-idle-mark.* /etc/systemd/system/
# sudo cp --preserve=mode zram-writeback.* /etc/systemd/system/

# Post update work
sudo udevadm control --reload
sudo sysctl --system
sudo systemctl daemon-reload
sudo systemctl restart intel_lpmd
