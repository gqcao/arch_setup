# Installation manual 
This is a step-by-step guide for installing Arch Linux on laptops.
### Copy an ISO image to the USB drive
```
lsblk
dd if=archlinux-??.iso of=/dev/sda status=progress
```
### Check if UEFI is enabled, and start an EFI system partition.
| One    | Two | Three | Four    | Five  | Six
|-|-|-|-|-|-
| Span <td colspan=3>triple  <td colspan=2>double


|  BIOS with MBR <td colspan=3>                                            |
| ------------- |:-------------:| ---------------:| ----------------------:|
|`/mnt` 	|`/dev/sdX1` 	|Linux 	          | Remainder of the device|

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
