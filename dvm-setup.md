# dvm setup
## Download and install dwm
```
git clone https://github.com/LukeSmithxyz/dwm.git
cd dwm 
sudo make install
```
## Add tab
- Apply the patch
```
wget https://dwm.suckless.org/patches/tab/dwm-tab-i3like-20211121-a786211.diff
cd dwm
git apply patches/dwm-tab-i3like-20211121-a786211.diff
## Alternatively,
patch < patches/dwm-tab-i3like-20211121-a786211.diff
```
- Add the following code in `config.h`
```
 /*   Display modes of the tab bar: never shown, always shown, shown only in  */
 /*   monocle mode in presence of several windows. */
 /*   A mode can be disabled by moving it after the showtab_nmodes end marker */
 enum showtab_modes { showtab_never, showtab_auto, showtab_nmodes, showtab_always};
 static const int showtab   = showtab_auto; /* Default tab bar show mode  */
  static const Bool toptab  = True;         /* False means bottom tab bar */
```
- Install
sudo make install
## Download and install dwmblocks
```
git clone https://github.com/LukeSmithxyz/dwmblocks.git
cd dwmblocks
sudo make install
```
## Download and install st
```
git clone https://github.com/LukeSmithxyz/st.git
cd st
sudo make install
```
## Run dwm and dwmblocks
In `xinitrc`, add the following.
```
dwmblocks &
exec startdwm
```
