echo "YOU MUST HAVE AN INTERNET CONNECTION FOR THIS AND RUN THIS PROGRAM AS A NON ROOT USER, THE SCRIPT WILL START IN 3 SECONDS"
sleep 3
sudo cp -r etc/* /etc/
cp -r home/* ~/
mkdir ~/.config
sudo cp home/.config/xmouseless/xmouseless /usr/local/bin/
sudo cp -r home/* /root/
sudo cp -r cursor/Pokemon /usr/share/icons/
sudo cp cursor/index.theme /usr/share/icons/default/index.theme
sudo pacman -Sy --noconfirm vlc wget curl bpytop qemu virt-manager dnsmasq libvirt qbittorrent iwd bluez bluez-utils blueman ranger mpv git picom rofi feh xorg-xinit xorg-server xorg-xrandr xorg-xev xorg-xprop pulseaudio pulsemixer dosfstools terminator i3-gaps base-devel unclutter ttf-liberation ttf-dejavu bash-completion p7zip tmux awesome-terminal-fonts w3m elinks ffmpegthumbnailer highlight libcaca mediainfo odt2txt poppler ueberzug
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
yay -S --noconfirm betterlockscreen polybar mkinitcpio-bluetooth
sudo mkinitcpio -p linux
sudo systemctl enable bluetooth libvirtd
sudo ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime
sudo timedatectl set-ntp true
sudo hwclock --systohc
sudo shopt -s extglob
echo "PC WILL REBOOT IN 3 SECONDS"
sleep 3
reboot
