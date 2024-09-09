#!/usr/bin/env fish

# font configuration
sudo ln -s /usr/share/fontconfig/conf.avail/10-unhinted.conf /etc/fonts/conf.d/
sudo ln -s /usr/share/fontconfig/conf.avail/10-hinting-none.conf /etc/fonts/conf.d/
sudo ln -s /usr/share/fontconfig/conf.avail/10-sub-pixel-none.conf /etc/fonts/conf.d/
sudo rm /etc/fonts/conf.d/10-hinting-slight.conf
sudo rm /etc/fonts/conf.d/11-lcdfilter-default.conf
