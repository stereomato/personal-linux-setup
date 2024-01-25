if status is-interactive
# Commands to run in interactive sessions can go here
end

# Fish settings
set -gx fish_greeting ""
# Path tweaks
# Not needed because of environment.localBinInPath
#fish_add_path $HOME/.local/share/bin
# Not needed on nixOS
#fish_add_path /usr/sbin
#fish_add_path /sbin

# Aliases
alias edit-fish-config="nano $HOME/.config/fish/config.fish"
alias disable-pstate="sudo bash -c 'echo passive >  /sys/devices/system/cpu/intel_pstate/status'"
alias enable-pstate="sudo bash -c 'echo active >  /sys/devices/system/cpu/intel_pstate/status'"
alias schedutil-tweak="sudo bash -c 'echo 0 > /sys/devices/system/cpu/cpufreq/schedutil/rate_limit_us'"
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias memstats="watch -n 0.5 cat /proc/meminfo"
alias mic-latency-fix="pw-cli s 49 Props '{ params = [ \"api.alsa.headroom\" 256 ] }'"
alias mirror-phone="scrcpy -b 10M --max-fps 60 -w -S"
alias normalize-MONKE="find . -name \*.ape -execdir loudgain -a -k -s e '{}' +"
alias normalize-m4a="find . -name \*.m4a -execdir loudgain -a -k -s e '{}' +"
alias vscode-folder-fix="gio mime inode/directory org.gnome.Nautilus.desktop"
alias vmware-modules-fix="sudo CPATH=/usr/src/kernels/$(uname -r)/include/linux vmware-modconfig --console --install-all"
alias gpu-stats="sudo intel_gpu_top"
alias zswap_stats="sudo (which zswap-stats)"
alias dl-music-wav="yt-dlp -x --audio-format wav --audio-quality 0"
alias dl-music="yt-dlp -x --audio-quality 0"
alias mangohud-intel-workaround="sudo chmod o+r /sys/class/powercap/intel-rapl\:0/energy_uj && echo 'Remember to run disable-mangohud-intel-workaround!'"
alias disable-mangohud-intel-workaround="sudo chmod o-r /sys/class/powercap/intel-rapl\:0/energy_uj"
# alias wav2wvc="find . -name \*.wav -execdir wavpack --allow-huge-tags -b256 -hh -x4 -c --import-id3 -m -v -w Encoder -w Settings {} -o ~/Music/WavPack/{}.temp \; -execdir wvgain ~/Music/WavPack/{}.temp \;"
alias loudgain4wavs="find . -name \*.wav -execdir loudgain -a -k --tagmode=e '{}' \;"
alias connect2phone="scrcpy --tcpip=192.168.1.50:39241 --power-off-on-close --turn-screen-off -b 10M --disable-screensaver --stay-awake"
