% Post configurations
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
## Install windows manager
```
pacman -S i3-gaps i3blocks rxvt-unicode dmenu
```
## Install fonts including Chinese
```
pacman -S noto-fonts noto-fonts-cjk
```
## Install git
```
pacman -S git openssh
```
## Copy config files from my Github repo
```
# move to user "gcao"
su gcao
pwd
mkdir ~/Projects
git clone https://github.com/gqcao/arch_setup.git 
# copy bashrc and then reboot
reboot
```
## Install Ranger
```
wget https://ranger.github.io/ranger-stable.tar.gz
cd ~/tools/
tar xvf ranger-stable.tar.gz
```
## Other useful software and tips
```
# gimp
p -S gimp # Problem with gsfonts in urxvt and i3blocks
p -S ttf-dejavu # gives an alternative dependency

# mount usb
sudo pacman -S udisk2
sudo ln -s /run/media /media
sudo pacman -S ntfs-3g # Old hardrive uses ntfs format
udisksctl mount -b /dev/sdb1
udisksctl unmount -b /dev/sdb1

# Need **ttf-font-awesome** to show icons in i3blocks, 
sudo pacman -S ttf-font-awesome
```
## Adjust backlight by keyboard and hotkeys
```
pacman -S acpi acpilight
# reboot and include the user in 'video' group for 'brightness' file to modify its content
The directory of brightness is '/sys/class/backlight/acpi_video0/brightness'
sudo usermod -aG video gcao
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
sudo pacman -S pulseaudio pulsemixer
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
"""
pacman -S openconnect networkmanager-openconnect
"""
## Latex
```
sudo pacman -S texlive-most  # Install packages including texlive-core, textlive-bin, textlive-latexextra, textlive-bibtexextra.
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
### Set time manually on RPi
```
timedatectl set-ntp False
timedatectl set-time "2022-11-02 20:30:00"
```
