#!/bin/bash

shopt -s autocd #Allow to cd into directory with just directory name

source /usr/share/git/completion/git-prompt.sh

export PS1="\[$(tput bold)$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 4)\]@\[$(tput setaf 2)\]\h:\[$(tput setaf 5)\]\w\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\[\$(parse_git_branch_color)\]\$(parse_git_branch)\$\[$(tput sgr0)\] "
#check the window size after each command and, if necessary update values of LINES and COLUMNS
shopt -s checkwinsize

#ssh
eval $(ssh-agent) > /dev/null

# Colors for the prompt
no_color="\033[0;0m"
blue="\033[0;34m"
white="\033[0;37m"
red="\033[0;31m"
green="\033[0;32m"
yellow="\033[0;33m"
cyan="\033[0;36m"

# High Intensty
hblack="\033[0;90m"       # Black
hred="\033[0;91m"         # Red
hgreen="\033[0;92m"       # Green
hyellow="\033[0;93m"      # Yellow
hblue="\033[0;94m"        # Blue
hpurple="\033[0;95m"      # Purple
hcyan="\033[0;96m"        # Cyan
hwhite="\033[0;97m"       # White


parse_git_branch() {
    gitstatus="$(git status 2> /dev/null)"
    if [[ `echo $gitstatus | grep "Changes to be committed"` != "" ]]
    then
        git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1***)/'
    elif [[ `echo $gitstatus | grep "Changes not staged for commit"` != "" ]]
    then
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1**)/'
    elif [[ `echo $gitstatus | grep "Untracked"` != "" ]]
    then
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1*)/'
    elif [[ `echo "$gitstatus" | grep "nothing to commit"` != "" ]]
    then
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
    else
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1?)/'
    fi
}

# Echo a non-printing color character depending on whether or not the current git branch is the master
# DOES not print the branch name
# Uses the parse_git_branch() function for that
parse_git_branch_color() {
    br=$(parse_git_branch)
    if [[ $br == "(master)" || $br == "(master*)" ]]; then
        echo -e "${green}"
    elif [[ $br == "(master**)" || $br == "(master***)" ]]
    then
        echo -e "${red}"
    else
	echo -e "${blue}"
    fi
}

#Aliases
#if [ -f ~/.bashrc_aliases ]; then
#     . ~/.bash_aliasees
#fi
alias trash="trash-put"
alias rm="echo 'rm disabled. Use trash to move to Trash/file'"
alias mv="mv -i"
alias cht.sh="~/bin/cht.sh"

# Adding color
alias git='LANG=en_GB git'
alias ls='ls -hN --color=auto --group-directories-first'
alias grep="grep --color=auto"
alias diff="diff --color=auto"
alias ccat="highglight --outt-format-ansi" #Color cat with syntax highlight

#latex
alias tlmgr="${TEXFMDIST}/scripts/texlive/tlmgr.pl --usermode"

complete -C /usr/bin/consul consul
