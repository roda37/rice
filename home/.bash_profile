# START XSERVER ON LOGIN

#[[ -f ~/.bashrc ]] && . ~/.bashrc
#if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
#  exec startx
#fi

# START TMUX ON TERMINAL STARTUP
if command -v tmux>/dev/null; then
 [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && tmux
fi

. ~/.bashrc &
