 #!/bin/sh

[[ -f ~/.bashrc ]] && . ~/.bashrc

export PATH="$PATH:$(du "$HOME/.scripts/" | cut -f2 | tr '\n' ':')"
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:$HOME/.local/share/gem/ruby/3.0.0/bin"
export PATH="$PATH:$HOME/SHA256/cprover"

export FILE="ranger"
export EDITOR="vim"
export TERMINAL="st"
export BROWSER="chromium"
export TEXFMDIST="/usr/share/texmf-dist"

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
