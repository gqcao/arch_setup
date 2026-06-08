# debian_setup

Some info to set up the work computer in Debian distro.

## Download iso image
The latest images can be found in the [webpage](https://cdimage.debian.org/cdimage/release/current-live/amd64/iso-hybrid/), and `amd64-mate` is preferred for me.
```
lsblk
dd if=debian-live-???-amd64-mate.iso of=/dev/sda status=progress
```
## Install gvim
```
sudo apt install vim-gtk3
```
## Miniconda
```
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh
```
## Debian install Java 8
### Install `sdkman`
```
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk version
```
### Install JDK 8
```
sdk install java 8.0.292-zulu
sdk list
```
### Include the line in `bashrc` to run `sdkman`
```
source "$HOME/.sdkman/bin/sdkman-init.sh"
```
## Teams for Linux
We adopt the binary release from `https://github.com/IsmaelMartinez/teams-for-linux/releases`
```
wget -P $HOME/Downloads https://github.com/IsmaelMartinez/teams-for-linux/releases/download/v2.11.1/teams-for-linux-2.11.1.tar.gz
```

## Install Chinese input from Fcitx5
```
sudo apt install fcitx5 fcitx5-chinese-addons
im-config
```
## Latex
```
sudo apt install texlive-full
```
## Docker
- Instruction on [Docker website](https://docs.docker.com/engine/install/debian/)
- Instruction on [DigitalOcean](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-debian-10) 
