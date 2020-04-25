# Installation manual 
This is a step-by-step guide for installing Arch Linux on laptops.
### Copy an ISO image to the USB drive
```
lsblk
dd if=archlinux-??.iso of=/dev/sda status=progress
```
### Check if UEFI is enabled, and start an EFI system partition.
|  BIOS with MBR                                 |
| Mount point 	| Partition 	| Partition type  | Suggested size         |
| ------------- |:-------------:| ---------------:| ----------------------:|
|`/mnt` 	|`/dev/sdX1` 	|Linux 	          | Remainder of the device|
|[SWAP] 	|`/dev/sdX2` 	|Linux swap 	  |More than 512 MiB       |
### Partition the disks
```
fdisk /dev/sda 
```
### Update the system clock
```
timedatectl set-ntp true
```
