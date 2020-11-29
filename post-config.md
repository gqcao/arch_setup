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
## Copy config files from my github repo
```
# move to user "gcao"
su gcao
pwd
mkdir ~/Projects
git clone git@github.com:cgq5/arch_setup.git
# copy bashrc and then reboot
reboot
```
## Other useful software and tips
```
# gimp
p -S gimp # Problem with gsfonts in urxvt and i3blocks
p -S ttf-dejavu # gives an alternative dependency

# mount usb
sudo pacman -S udisk2
sudo ln -s /run/media /media 
udisksctl mount -b /dev/sdb1
udisksctl unmount -b /dev/sdb1

# Need **ttf-font-awesome** to show icons in i3blocks, 
sudo pacman -S ttf-font-awesome
```

## Adjust backlight by keyboard and hotkeys
```
pacman -S acpi acpilight
# reboot and include the user in 'video' group for 'brightness' file to modify its content
```
