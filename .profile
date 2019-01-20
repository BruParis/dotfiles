[[ -f ~/.bashrc ]] && . ~/.bashrc

export PATH="$PATH:$(du "$HOME/.scripts/" | cut -f2 | tr '\n' ':')"
export FILE="ranger"
export EDITOR="vim"
export TERMINAL="st"
export BROWSER="chromium"
export WALLPAPERS="$HOME/Document/Wallpapers/"

if [[ "$(tty)" = "/dev/tty1" ]]; then
	prgrep i3 || startx
fi
