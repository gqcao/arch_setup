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
|`/mnt` 	|`/dev/sdX1` 	|Linux 	          | Remainder of the device|
|[SWAP] 	|`/dev/sdX2` 	|Linux swap 	  |More than 512 MiB       |
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
### format drives
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
pacstrap /mnt base base-devel linux linux-firmware vim
```
### Create mounting point
```
genfstab -U /mnt >> /mnt/etc/fstab
cat /mnt/etc/fstab
```
### move to mount point
```
arch-chroot /mnt
```
### install wifi
```
pacman -S neworkmanager
```
### install grub for booting
```
grub-install --target=i386-pc /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
```
### some other setups
```
passwd
vim /etc/locale.gen
# uncomment "en_US.UTF-8 UTF-8" and "en_US ISO-8859-1"
locale-gen
vim /etc/locale.conf
# add the following
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
******************************/
```
### setup timezone
```
ln -sf /usr/share/zoneinfo/europe/stockholm /etc/localtime
```
### hostname 
```
vim /etc/hostname 
```
### getting ready for the firs boot
```
exit
umount -R /mnt
lsblk
reboot
```
