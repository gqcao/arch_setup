---
title: Arch Linux 64-bit (AArch64) Installation on RPi 4 
author: Guanqun Cao
date: \today
---

The original [instruction](https://archlinuxarm.org/platforms/armv8/broadcom/raspberry-pi-4) needs updates due to a [bug in U-boot](https://archlinuxarm.org/forum/viewtopic.php?t=16463). Here is the working guideline to install the OS on Raspberry Pi 4.

## Mount the SD Card to Linux Machine
- Identify the correct drive as shown below and replace sdX in the following instructions with the device name for the SD card as it appears on your computer.
```
lsblk
```
- Start `fdisk` to partition the SD card.
```
fdisk /dev/sdX
```
- At the `fdisk` prompt, delete old partitions and create a new one:
     - Type **o**. This will clear out any partitions on the drive.
     - Type **p** to list partitions. There should be no partitions left.
     - Type **n**, then **p** for primary, 1 for the first partition on the drive, press ENTER to accept the default first sector, then type **+500M** for the last sector. 200MB is not enough in the full 64 bit installation.
     - Type **t**, then **c** to set the first partition to type W95 FAT32 (LBA).
     - Type **n**, then **p** for primary, **2** for the second partition on the drive, and then press ENTER twice to accept the default first and last sector.
     - Write the partition table and exit by typing **w**.
- Create and mount the FAT filesystem:
```
mkfs.vfat /dev/sdX1
mkdir boot
mount /dev/sdX1 boot
```
- Create and mount the ext4 filesystem:
```
mkfs.ext4 /dev/sdX2
mkdir root
mount /dev/sdX2 root
```
- Download and extract the root filesystem (as root, not via sudo):
```
wget http://os.archlinuxarm.org/os/ArchLinuxARM-rpi-aarch64-latest.tar.gz
bsdtar -xpf ArchLinuxARM-rpi-armv7-latest.tar.gz -C root
sync
```
- Move boot files to the first partition:
```
mv root/boot/* boot
```
- Fix the bug in U-Boot. Here we suppose the SD card is being installed from a Linux machine.
    - Install `uboot-tools`
    ```
    pacman -S uboot-tools
    ```
    - U-boot bug fix in the `boot` folder. Navigate to the mounted `boot` folder. Modify the `/boot/boot.txt` to replace "fdt_addr_r" by "fdt_addr" on the lines starting with `booti` (2 lines). 
    - Then rebuild the `boot.scr` either using the script `./mkscr`, which is also located in `/boot`, or directly run the command line below under `/boot`.
    ```
    mkimage -A arm -T script -O linux -d boot.txt boot.scr
    ```
    - No need to modify `/etc/fstab` as instructed in the Arch Linux ARM [webpage](https://archlinuxarm.org/platforms/armv8/broadcom/raspberry-pi-4).
- Unmount the two partitions
```
umount boot root
```
## Mount the SD Card to RPi4
- Insert the SD card into the Raspberry Pi, connect ethernet, and apply 5V power.
- Use the serial console or SSH to the IP address given to the board by your router.
    - Login as the default user `alarm` with the password `alarm`.
    - The default `root` password is `root`.
- Initialize the pacman keyring and populate the Arch Linux ARM package signing keys
```
pacman-key --init
pacman-key --populate archlinuxarm
```
## Install Software on RPi4
