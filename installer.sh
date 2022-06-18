#!/usr/bin/bash

banner="HELLO"
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
	HEREDOC_VAR_1='d'
	HEREDOC_VAR_2='g'
	HEREDOC_VAR_3='n'
	HEREDOC_VAR_4='p'
	HEREDOC_VAR_5='1'
	HEREDOC_VAR_6='2048'
	HEREDOC_VAR_7='+1G'
	HEREDOC_VAR_8='t'
	HEREDOC_VAR_9='2'
	HEREDOC_VAR_10='+8G'
	HEREDOC_VAR_11='19'
	HEREDOC_VAR_12='3'
	HEREDOC_VAR_13='w'
	HEREDOC_VAR_14='82'
	HEREDOC_VAR_15='o'
	HEREDOC_VAR_16='ef'
	HEREDOC_VAR_17=' '
	if [[ -d "/sys/firmware/efi" ]]; then
		# if efi
 		echo "$HEREDOC_VAR_1" | fdisk /dev/"$whatdrive"
 		echo "$HEREDOC_VAR_1" | fdisk /dev/"$whatdrive"
 		echo "$HEREDOC_VAR_1" | fdisk /dev/"$whatdrive"
 		echo "$HEREDOC_VAR_1" | fdisk /dev/"$whatdrive" # DELETE
 		echo "$HEREDOC_VAR_2" | fdisk /dev/"$whatdrive" # GPT LABEL
 		echo "$HEREDOC_VAR_3" | fdisk /dev/"$whatdrive" # NEW PART EFI PART
 		echo "$HEREDOC_VAR_4" | fdisk /dev/"$whatdrive" # PRIMARY
 		echo "$HEREDOC_VAR_5" | fdisk /dev/"$whatdrive" # 1 PART
 		echo "$HEREDOC_VAR_6" | fdisk /dev/"$whatdrive" # START SIZE 2048
 		echo "$HEREDOC_VAR_7" | fdisk /dev/"$whatdrive" # END SIZE +1G
 		echo "$HEREDOC_VAR_8" | fdisk /dev/"$whatdrive" # TYPE PART 1
 		echo "$HEREDOC_VAR_16" | fdisk /dev/"$whatdrive" # EFI TYPE
 		echo "$HEREDOC_VAR_3" | fdisk /dev/"$whatdrive" # NEW PART SWAP PART
 		echo "$HEREDOC_VAR_4" | fdisk /dev/"$whatdrive" # PRIMARY
 		echo "$HEREDOC_VAR_9" | fdisk /dev/"$whatdrive" # 2 PART
 		echo "$HEREDOC_VAR_17" | fdisk /dev/"$whatdrive" # EMPTY SPACE FOR DEFAULT
 		echo "$HEREDOC_VAR_10" | fdisk /dev/"$whatdrive" # END SIZE +8G
 		echo "$HEREDOC_VAR_8" | fdisk /dev/"$whatdrive" # TYPE PART 2
 		echo "$HEREDOC_VAR_14" | fdisk /dev/"$whatdrive" # SWAP TYPE
 		echo "$HEREDOC_VAR_3" | fdisk /dev/"$whatdrive" # NEW PART ROOT
 		echo "$HEREDOC_VAR_4" | fdisk /dev/"$whatdrive" # PRIMARY
 		echo "$HEREDOC_VAR_12" | fdisk /dev/"$whatdrive" # 3 PART
 		echo "$HEREDOC_VAR_17" | fdisk /dev/"$whatdrive" # EMPTY SPACE FOR DEFAULT
 		echo "$HEREDOC_VAR_17" | fdisk /dev/"$whatdrive" # EMPTY SPACE FOR END OF DISK
 		echo "$HEREDOC_VAR_13" | fdisk /dev/"$whatdrive" # WRITES TO DISK
		mount /dev/"$whatdrive""3" /mnt # ROOT
		mkdir /mnt/boot
		mount /dev/"$whatdrive""1" /mnt/boot # EFI
		mkswap /dev/"$whatdrive""2"
		swapon /dev/"$whatdrive""2" # SWAP
		genfstab /mnt >> /mnt/etc/fstab
	else
		# if bios
 		echo "$HEREDOC_VAR_1" | fdisk /dev/"$whatdrive"
 		echo "$HEREDOC_VAR_1" | fdisk /dev/"$whatdrive"
 		echo "$HEREDOC_VAR_1" | fdisk /dev/"$whatdrive"
 		echo "$HEREDOC_VAR_1" | fdisk /dev/"$whatdrive" # DELETE
 		echo "$HEREDOC_VAR_15" | fdisk /dev/"$whatdrive" # MBR LABEL
 		echo "$HEREDOC_VAR_3" | fdisk /dev/"$whatdrive" # NEW PART SWAP
 		echo "$HEREDOC_VAR_4" | fdisk /dev/"$whatdrive" # PRIMARY PART
 		echo "$HEREDOC_VAR_5" | fdisk /dev/"$whatdrive" # 1 PART
 		echo "$HEREDOC_VAR_6" | fdisk /dev/"$whatdrive" # START SIZE 2048
 		echo "$HEREDOC_VAR_10" | fdisk /dev/"$whatdrive" # END SIZE +8G
 		echo "$HEREDOC_VAR_8" | fdisk /dev/"$whatdrive" # PART TYPE 
 		echo "$HEREDOC_VAR_14" | fdisk /dev/"$whatdrive" # SWAP TYPE
 		echo "$HEREDOC_VAR_3" | fdisk /dev/"$whatdrive" # NEW PART ROOT
 		echo "$HEREDOC_VAR_4" | fdisk /dev/"$whatdrive" # PRIMARY PART
 		echo "$HEREDOC_VAR_9" | fdisk /dev/"$whatdrive" # 2 PART
 		echo "$HEREDOC_VAR_17" | fdisk /dev/"$whatdrive" # EMPTY SPACE FOR START SIZE
 		echo "$HEREDOC_VAR_17" | fdisk /dev/"$whatdrive" # EMPTY SPACE FOR END SIZE
 		echo "$HEREDOC_VAR_13" | fdisk /dev/"$whatdrive" # WRITE TO DISK
		mount /dev/"$whatdrive""2" /mnt
		mkswap /dev/"$whatdrive""1"
		swapon /dev/"$whatdrive""1"
		genfstab /mnt >> /mnt/etc/fstab
	fi
	arch-chroot /mnt
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
