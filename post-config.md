# Post configurations
This page is intended to install the essential packages and configuration after the Arch Linux installation.

## User setup
```
useradd -m -g wheel gcao
passwd gcao
# Other commands
useradd, userdel, groupadd, groupdel
```
## Add user to sudoers
```
vim /etc/sudoers
# Uncomment "%wheel ALL=(ALL) ALL"
```
## Install X windows
```
pacman -S xorg-server xorg-xinit
```
## Install git, openssh, wget
```
pacman -S git openssh wget
```
## Copy config files from my Github repo
```
# move to user "gcao"
su gcao
pwd
mkdir ~/Projects
git clone https://github.com/gqcao/arch_setup.git
cp .bashrc .vimrc .xinitrc ~/
reboot
```
## Install windows manager
### dwm, dwmblocks, st
```
git clone https://github.com/gqcao/suckless.git
```
Walk through `suckless-setup.md` for the installation.
### dmenu
```
sudo pacman -S dmenu
```
### i3-wm
```
pacman -S i3-wm i3blocks rxvt-unicode
```
## Install Ranger
```
wget https://ranger.github.io/ranger-stable.tar.gz
cd ~/tools/
tar xvf ranger-stable.tar.gz
```
## Fonts
### Show icons in dwmblocks
```
pacman -S ttf-font-awesome noto-fonts-emoji
```
### Install fonts including Chinese
```
pacman -S noto-fonts noto-fonts-cjk
```
### List all installed fonts
```
fc-list | less
```
## gimp
```
pacman -S gimp           # Problem with gsfonts in urxvt and i3blocks
pacman -S ttf-dejavu     # Gives an alternative dependency
```
## Chinese inputs
```
sudo pacman -S fcitx fcitx-configtool fcitx-googlepinyin
```
## Linux Sound System
```
# The package contains the alsamixer and amixer utilities
sudo pacman -S alsa-utils
```
### Umute the sound card
```
## Use amixer
amixer sset Master unmute
amixer sset Speaker unmute
amixer sset Headphone unmute
# Use alsamixer
alsamixer
```
## Install PulseAudio to show the volume bar
```
sudo pacman -S pulseaudio pulseaudio-alsa pulsemixer
```
## xrandr  
```
sudo pacman -S xorg-xrandr arandr 
```
## Network manager applet on a system tray
```
sudo pacman -S network-manager-applet 
```
### nm-applet says Not authorized to control network
```
# Install polkit
sudo pacman -S polkit
sudo systemctl start polkit

# Add to network group
sudo usermod -G network -a gcao
```
## VPN on network manager
```
pacman -S openconnect networkmanager-openconnect
```
## Latex
```
sudo pacman -S texlive-most  # Install packages including texlive-core, textlive-bin, textlive-latexextra, textlive-bibtexextra.
```
## Java
### Impersonate another window manager
A problem may occur to show Java applications like JabRef, as JVM hard-coded a list of known of Window Managers while `dvm` is not one of them. One solution is to install `wmname` from `suckless.org`, and then run
```
wmname LG3D
```
### Install and Use JRE 8
```
sudo pacman -S jre8-openjdk
# Switch to JRE 8 if there exists another version
archlinux-java status
archlinux-java set java-8-openjdk/jre
```
### Downloand and install JabRef
```
wget "https://downloads.sourceforge.net/project/jabref/v1.0%20to%20v2.11.1/2.9.2/JabRef-2.9.2.jar?ts=gAAAAABmL2WjGUVNr-bu21QGT544qGlMn6iQR4eAJjF2OXwBjlpslFlY7Er06pl76F4kaMJ2gRDnRqCFxunOCfNwYUpckjMccg%3D%3D&r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Fjabref%2Ffiles%2Fv1.0%2520to%2520v2.11.1%2F2.9.2%2FJabRef-2.9.2.jar%2Fdownload" -O JabRef-2.9.2.jar
java -jar JabRef-2.9.2.jar
```
## Screenshot
```
sudo pacman -S gnome-screenshot
```
## Bluetooth
### Install necessary *bluez* packages
```
sudo pacman -S bluez bluez-utils
```
### Start the bluetooth service 
```
sudo systemctl start bluetooth
rfkill unblock bluetooth
bluetoothctl power on
```
### Start bluetooth support for the audio
```
sudo pacman -S pulseaudio-bluetooth
pulseaudio -k
pulseaudio --start
```
### Enable bluetooth in RPi
From `/boot/config.txt`, uncomment the corresponding line.

## Update system clock on RPi
```
sudo pacman -S chrony
sudo chronyd   # To start off
```
### Manually set time on RPi
```
timedatectl set-ntp False
timedatectl set-time "2022-11-02 20:30:00"
```
## Mount USB
```
sudo pacman -S udisks2
sudo ln -s /run/media /media
sudo pacman -S ntfs-3g   # Old hardrive uses ntfs format
udisksctl mount -b /dev/sdb1
udisksctl unmount -b /dev/sdb1
```
## Phone file transfer
```
sudo pacman -S android-file-transfer
aft-mtp-mount ~/mnt         # Mount
fusermount -u mountpoint    # Unmount
```
## Adjust backlight by keyboard and hotkeys
```
pacman -S acpi acpilight
# reboot and include the user in 'video' group for 'brightness' file to modify its content
The directory of brightness is '/sys/class/backlight/acpi_video0/brightness'
sudo usermod -aG video gcao
```
