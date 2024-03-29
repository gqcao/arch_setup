# Installation manual 
This is a step-by-step guide for installing Arch Linux on laptops.
### Copy an ISO image to the USB drive
```
lsblk
dd if=archlinux-??.iso of=/dev/sda status=progress
```
### Update the system clock
```
timedatectl set-ntp true
```
### Check if UEFI is enabled, and start an EFI system partition.
```
ls /sys/firmware/efi/efivars
```
#### BIOS with MBR
| Mount point 	| Partition 	| Partition type  | Suggested size         |
| ------------- |:-------------:| ---------------:| ----------------------:|
|[SWAP] 	|`/dev/sdX1` 	|Linux swap 	  | 12 GB                  |
|`/mnt` 	|`/dev/sdX2` 	|Linux 	          | Remainder of the device|
#### More advanced BIOS with MBR
| Mount point 	| Partition 	| Partition type  | Suggested size         |
| ------------- |:-------------:| ---------------:| ----------------------:|
|`/mnt/boot` 	|`/dev/sdX1` 	|Linux boot | 200 MiB |
|[SWAP] 	|`/dev/sdX2` 	|Linux swap 	  | 12 GB  |
|`/mnt/` 	|`/dev/sdX3` 	|Linux root | 30 GB  |
|`/mnt/home` 	|`/dev/sdX4` 	|Linux home | Remainder of the device|
#### UEFI with GPT
| Mount point 	| Partition 	| Partition type  | Suggested size         |
| ------------- |:-------------:| ---------------:| ----------------------:|
|`/mnt/boot` or `/mnt/efi`| 	/dev/sdX1| 	EFI system partition| 	260–512 MiB|
|`/mnt`| 	`/dev/sdX2`| 	Linux x86-64 root (/)| 	Remainder of the device|
|[SWAP] |	`/dev/sdX3`| 	Linux swap 	|More than 512 MiB |
### Partition the disks
```
fdisk /dev/sda
```
### Format disks 
```
mkfs.ext4 /dev/sda1 # boot partition
mkfs.ext4 /dev/sda3 # root partition
mkfs.ext4 /dev/sda4 # home partition
```
### Create swap partition
```
mkswap /dev/sda2
swapon /dev/sda2
```
### Mount the disks
```
mount /dev/sda3 /mnt
mkdir /mnt/boot
mkdir /mnt/home
mount /dev/sda1 /mnt/boot
mount /dev/sda4 /mnt/home
lsblk
```
### Install essential packages
```
pacstrap /mnt base base-devel linux linux-firmware gvim
```
### Create mounting point
```
genfstab -U /mnt >> /mnt/etc/fstab
cat /mnt/etc/fstab
```
### Move to mount point
```
arch-chroot /mnt
```
### Install network manager 
```
pacman -S networkmanager
systemctl enable NetworkManager
```
### Install grub for booting
```
pacman -S grub
grub-install --target=i386-pc /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
```
### UEFI booting
#### Partition a UEFI drive
```
mkfs.fat -F32 /dev/sdxY
```
#### Install boot tool 
```
mkdir /mnt/efi
pacman -S dialog wpa_supplicant refind-efi
mkdir -p /esp/EFI/Boot
cp /usr/share/refind/refind_x64.efi /esp/EFI/Boot/bootx64.efi
cp -r /usr/share/refind/drivers_x64/ /esp/EFI/Boot/
echo 'extra_kernel_version_strings linux,linux-hardened,linux-lts,linux-zen,linux-git;' > /esp/EFI/Boot/refind.conf
echo 'fold_linux_kernels false' >> /esp/EFI/Boot/refind.conf
echo 'default_selection "linux from"' >> /esp/EFI/Boot/refind.conf
https://wiki.archlinux.org/index.php/User:Soloturn/Quick_Installation_guide_UEFI
```
### Some other setups to setup
```
passwd
vim /etc/locale.gen
# uncomment "en_US.UTF-8 UTF-8" and "en_US ISO-8859-1"
locale-gen
# push locale config
wget https://raw.githubusercontent.com/gqcao/arch_setup/master/locale.txt
cat locale.txt > /etc/locale.conf
# open and add the text
vim /etc/locale.conf
/******************************
LANG=en-US.UTF-8
LC_CTYPE="en_US.UTF-8"
LC_NUMERIC="en_US.UTF-8"
LC_TIME="en_US.UTF-8"
LC_COLLATE="en_US.UTF-8"
LC_MONETARY="en_US.UTF-8"
LC_MESSAGES="en_US.UTF-8"
LC_PAPER="en_US.UTF-8"
LC_NAME="en_US.UTF-8"
LC_ADDRESS="en_US.UTF-8"
LC_TELEPHONE="en_US.UTF-8"
LC_MEASUREMENT="en_US.UTF-8"
LC_IDENTIFICATION="en_US.UTF-8"
LC_ALL=en_US.UTF-8
******************************/
```
### setup timezone
```
ln -sf /usr/share/zoneinfo/Europe/Stockholm /etc/localtime
```
### Set hostname 
```
vim /etc/hostname 
```
### Getting ready for the first boot
```
exit
umount -R /mnt
lsblk
reboot
```
