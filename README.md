# Installation

### Get Disk Blocks
lsblk

### Partitioning Tools
* cfdisk
* cgdisk

### Parition Notes
* GPT using Bios requires a 1MB partition as first partition with type BIOS Boot.
* GPT using EFI requires a 512MB parition as first patition with type EFI System formatted as FAT32.

### Formatting Partitions
* `mkfs.ext4 <parition name>`
* `mkfs.fat -F32 <partition name>`

### Mounting Partitions
* `mount <device> /mnt`
* `mount <device> /mnt/home`

### Pacstrap
* `pacstrap /mnt base base-sevel`

# Configuration
### Generate FSTAB
Generation: `genfstab -p /mnt >> /mnt/etc/fstab`
Output fstab: `cat /mnt/etc/fstab`

### chroot into installation
`arch-chroot /mnt`

### Set Hostname
`echo computer_name > /etc/hostname`

### Set Timezone
If you need a list of timezones run: `timedatectl list-timezones`

Set timezone with: `ln -s /usr/share/zoneinfo/*zone*/*subzone* /etc/localtime`

For London should be: `Europe/London`

### Set locale
Edit locale file with: `nano /etc/locale.gen`

For UK should be: `en_GB.UTF-8`

Generate locale with `locale-gen`

### Set keymap
Edit vconsole with `nano /etc/vconsole.conf`

Add `KEYMAP=uk` for UK

### Create Ramdisk
Set with `mkinitcpio -p linux`

### Set root password
Set with: `passwd`

# Boot Loader
## Single Boot (BIOS)
Install GRUB with: `pacman -S grub`

Install GRUB to MBR `grub-install /dev/sdx`

Configure GRUB: `grub-mkconfig -o /boot/grub/grub.cfg`

## Single Boot (EFI)
Install GRUB and EFI Boot Manager with: `pacman -S grub efibootmgr`

Mount ESP at /boot/efi with `mount <device> /boot/efi`

Install GRUB with `grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=grub`

Generate main config file with: `grub-mkconfig -o /boot/grub/grub.cfg`

## Multi Boot {EFI}
# Mount EFI Partition
Make dir for EFI mount: `mkdir -p /mnt/boot/efi`

Get partitions with: `gdisk -l /dev/sdx`

Disk with 100MB size and Name of EFI system partition is the one to use

Mount EFI with: `/mount/dev/sdx# /mnt/boot/efi`

# Generate fstab
Generate: `genfstab -p /mnt > /mnt/etc/fstab`

Output fstab: `cat /mnt/etc/fstab`

# Final Conf
### Add new user
`useradd -m -G wheel -s /bin/bash -c "Full Name" username`

`passwd username`

`nano /etc/sudoers`

Add `username ALL=(ALL) ALL`

### Enable DHCP
Get network adaptors: `ip addr`

Enable with `systemctyl enable dhcpcd@xxx.service`

### Add Yaourt
Edit: `/etc/pacman.conf`

Add the following repo:

```bash
[archlinuxfr]
SigLevel = Never
Server = http://repo.archlinux.fr/$arch
```

Sync pacman with `pacman -Syu`

Install Yaourt with `pacman -S yaourt`

### Install Audio
Install with `pacman -S pulseaudio pulseaudio-alsa`

### Install Genv
Install Gnome Desktop `pacman -S gnome-desktop`

Install Xterm `pacman -S xterm`

Install GDM `pacman -S gdm`

Enable GDM with: `systemctl enable gdm`
