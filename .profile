[[ -f ~/.bashrc ]] && . ~/bashrc

export PATH=$PATH:$HOME/.scripts
export EDITOR="vim"
export TERMINAL="st"
export BRWOSER="chromium"

if [[ "$(tty)" = "/dev/tty1" ]]; then
	prgrep i3 || startx
fi
