 #!/bin/sh

[[ -f ~/.bashrc ]] && . ~/.bashrc

export PATH="$PATH:$(du "$HOME/.scripts/" | cut -f2 | tr '\n' ':')"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.local/bin"

export FILE="ranger"
export EDITOR="vim"
export TERMINAL="st"
export BROWSER="chromium"

export WALLPAPERS="$HOME/Document/Wallpapers/"
export DOTFILES_PATH="$HOME/Repos/dotfiles/"

export PATH="$HOME/.cargo/bin:$PATH"

if [[ "$(tty)" = "/dev/tty1" ]]; then
	prgrep i3 || startx
fi

setxkbmap fr &
xset r rate 400 70 &
xbindkeys &
xcompmgr &
setbg &
dwmblocks > /dev/null 2>&1 &
