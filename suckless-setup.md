# suckless software setup
We have the following software in my personal [repo](https://github.com/gqcao/suckless).

- dwm-6.4
- dwmblocks
- st-0.9
- slock-1.5

## Download and install dwm
```
git clone https://github.com/gqcao/suckless.git
cd suckless/dwm
sudo make install
```
## Apply new patches
For example,
```
patch < patches/dwm-tab-i3like-20211121-a786211.diff
```
- Install
```
make clean
rm config.h
sudo make install
```
## Download and install dwmblocks
```
cd suckless/dwmblocks
sudo make install
```
## Download and install st
```
cd suckless/st
sudo make install
```
## Run dwm and dwmblocks
In `xinitrc`, add the following.
```
dwmblocks &
exec dwm
```
