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
pacman -S i3-gaps i3status rxvt-unicode dmenu
```

## Install fonts including Chinese
```
pacman -S noto-fonts noto-fonts-cjk
```

## Install git
```
pacman -S git
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



