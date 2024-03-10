# dvm setup
## Download and install dwm
```
git clone https://github.com/gqcao/suckless.git
cd suckless/dwm
sudo make install
```
## Add tab
- Apply the patch
```
git apply patches/dwm-tab-i3like-20211121-a786211.diff
## Alternatively,
patch < patches/dwm-tab-i3like-20211121-a786211.diff
```
- Install
```
make clean
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
dunst &
dwmblocks &
exec dwm
```
