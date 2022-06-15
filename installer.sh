#!/usr/bin/bash

banner="  _,     ,_
    .'/  ,_   \'.
   |  \__( >__/  |
   \             /
    '-..__ __..-'
         /_\
"

if [ "$EUID" -ne 0 ]
then echo "Please run as root"
exit
fi

start () {
	echo $banner

	echo This will install a custom Arch Linux environment, do you want to proceed? [y/n]

	read choice
	lsblk
	echo What drive do you want to install your system on?
	read whatdrive
	if [[ -d "/sys/firmware/efi" ]]; then
		fdisk /dev/"$whatdrive" << FDISK_CMDS
		d
		d
		d
		d
		d
		d
		d
		g
		n
		p
		1
		2048
		+1G
		t
		1
		1
		n
		p
		2

		+8G
		t
		2
		19
		n
		p
		3

		
		w
		FDISK_CMDS
	else
		fdisk /dev/"$whatdrive" << FDISK_CMDS
		d
		d
		d
		d
		n
		p
		1

		+8G
		t
		1
		82
		n
		p
		2


		w
		FDISK_CMDS
	echo ARCH
	pacman -Sy vlc wget curl bpytop qemu virt-manager dnsmasq libvirt qbittorrent iwd bluez bluez-utils blueman ranger mpv git picom rofi feh xorg-xinit xorg-server xorg-xrandr xorg-xev xorg-xprop pulsemixer dosfstools terminator i3-gaps base-devel unclutter ttf-liberation ttf-dejavu bash-completion p7zip tmux awesome-terminal-fonts w3m elinks ffmpegthumbnailer highlight libcaca mediainfo odt2txt poppler ueberzug polybar i3lock firefox font-manager duf tldr exa dust ristretto yt-dlp dhcpcd btrfs-progs pipewire pipewire-pulse wireplumber vim grub efibootmgr linux linux-firmware base
	systemctl enable dhcpcd libvirtd bluetooth
	echo Do you want to create a new user? [y/n]
	read doeshe
	if [[ "$doeshe" == "y" ]]; then
		sed 's/^# %wheel ALL=(ALL:ALL) ALL/ %wheel ALL=(ALL:ALL) ALL/' -i /etc/sudoers
		echo Enter a new user name
		read name
		useradd -mG wheel $name
		echo Enter a password for the user
		passwd $name
		cp -r home/. /home/"$name"
	fi
	cp -r etc/. /etc/
	cp -r usr/. /usr/
	cp -r home/. /root/
	if [[ -d "/sys/firmware/efi" ]]; then
		grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=ARCHLINUX
		grub-mkconfig -o /boot/grub/grub.cfg
	else
		lsblk
		echo On what disk will you install the bootloader? [sdX]
		read sdx
		grub-install /dev/$sdx
		mkdir -p /boot/grub
		grub-mkconfig -o /boot/grub/grub.cfg
	fi
	mkinitcpio -P
	echo devidence > /etc/hostname
}

if [[ "$choice" == "y" ]]; then
	start
elif [[ "$choice" == "" ]]; then
	start
else
	exit
fi
