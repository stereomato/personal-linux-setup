## Stereomato's profile tweaks

# Source bashrc if found
[[ -f ~/.bashrc ]] && . ~/.bashrc

# Font emboldening
export FREETYPE_PROPERTIES="cff:no-stem-darkening=0 type1:no-stem-darkening=0 t1cid:no-stem-darkening=0 autofitter:no-stem-darkening=0"

# Enable HW encoding and other features for Kooha
export KOOHA_EXPERIMENTAL=1

# Enable wayland for QT apps # Disabled atm, causes issues with some apps, enable on a app to app basis 
# Lol its enabled by qgnomeplatform anyway
export QT_QPA_PLATFORM=wayland
export QT_WAYLAND_DECORATION=adwaita

# Set nano as the EDITOR
export EDITOR=nano

# Enable wayland for Mozilla apps
export MOZ_ENABLE_WAYLAND=1

# Enable python-symengine
export USE_SYMENGINE=1

# Prevent wine from creating menu entries
export WINEDLLOVERRIDES=winemenubuilder.exe=d

# NixOS-specific: Unable wayland for chrome/electron apps.
export NIXOS_OZONE_WL=1

# Mesa: Enable opengl threading, disabled because it's best enabled on a case to case basis.
#export mesa_glthread=true
