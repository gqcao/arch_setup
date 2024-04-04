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
## Debian install openjdk 8
- Add the following line to `/etc/apt/sources.list`
```
deb http://deb.debian.org/debian/ sid main
```
- Install `openjdk8`
```
sudo apt-get update
sudo apt-get install -y openjdk-8-jdk
```
- Choose java version
`sudo update-alternatives --config java`

## Teams on Debian
There is an archived version based on this [forum](https://askubuntu.com/questions/1457083/cant-download-microsoft-teams-deb-file), and follow the instruction below.
```
wget https://web.archive.org/web/20221130115842/https://packages.microsoft.com/repos/ms-teams/pool/main/t/teams/teams_1.5.00.23861_amd64.deb
sudo apt install ./teams_1.5.00.23861_amd64.deb 
```

## Install Chinese input from Fcitx5
```
sudo apt install fcitx5 fcitx5-chinese-addons
```
