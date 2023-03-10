export EDITOR='vim'
set -o vi
alias ls='ls --color=auto'
alias l='ls -lahF'
#alias l='exa -lag'
alias gr='sudo pacman -Rsdd'
alias gs='pacman -Ssq'
alias gi='pacman -Si'
alias g='sudo pacman -S'
alias gg='sudo pacman -Sy'
alias ggg='sudo pacman -Scc'
alias i='makepkg -si'
alias e='vim ~/.config/i3/config'
alias m='cd ~/music'
alias r='ranger'
alias p='mpv --no-video'
alias ggu='sudo pacman -Syu'
alias gu='sudo pacman -Su'
alias c='cd ~/Downloads'
alias v='vim'
alias ri='eog'
alias u='sudo umount /mnt'
alias gy='sudo pacman -S --noconfirm'
alias o='bpytop'
alias df='duf'
alias find='fd -H'
alias tree='dust -b'
alias w='curl wttr.in'
alias start='sudo systemctl start'
alias stop='sudo systemctl stop'
alias restart='sudo systemctl restart'
alias stat='sudo systemctl status'
alias n='ping -c 3 gnu.org'
alias cp='pycp -g'
alias m='cd /micron'
alias t='tmux'
