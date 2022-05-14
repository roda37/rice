echo "YOU MUST HAVE AN INTERNET CONNECTION FOR THIS AND RUN THIS PROGRAM AS A NON ROOT USER, THE SCRIPT WILL START IN 3 SECONDS"
sleep 3

# Making dirs
mkdir ~/.config
mkdir /root/.config

# Copying config files
cp -r home/. ~/
sudo cp -r home/. /root/
sudo cp -r etc/* /etc/
sudo cp home/.config/xmouseless/xmouseless /usr/local/bin/

# Cursor
sudo cp -r cursor/Pokemon /usr/share/icons/
sudo cp cursor/index.theme /usr/share/icons/default/index.theme

# Packages
sudo pacman -Sy --noconfirm vlc wget curl bpytop qemu virt-manager dnsmasq libvirt qbittorrent iwd bluez bluez-utils blueman ranger mpv git picom rofi feh xorg-xinit xorg-server xorg-xrandr xorg-xev xorg-xprop pulseaudio pulsemixer dosfstools terminator i3-gaps base-devel unclutter ttf-liberation ttf-dejavu bash-completion p7zip tmux awesome-terminal-fonts w3m elinks ffmpegthumbnailer highlight libcaca mediainfo odt2txt poppler ueberzug polybar i3lock steam

# Services
sudo mkinitcpio -P
sudo systemctl enable bluetooth libvirtd

# Time config
sudo ln -sf /usr/share/zoneinfo/Europe/Belgrade /etc/localtime
sudo timedatectl set-ntp true
sudo hwclock --systohc

# Bash config
sudo shopt -s extglob

# Reboot
echo "PC WILL REBOOT IN 3 SECONDS"
sleep 3
reboot
