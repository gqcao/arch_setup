# Installation manual 
This is a step-by-step guide for installing Arch Linux on laptops.
### Copy an ISO image to the USB drive
```
lsblk
dd if=archlinux-??.iso of=/dev/sda status=progress
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
|`/mnt/root` 	|`/dev/sdX3` 	|Linux root | 25 GB  |
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
### Update the system clock
```
timedatectl set-ntp true
```
