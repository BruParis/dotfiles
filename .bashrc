#!/bin/bash


shopt -s autocd #Allow to cd into directory with just directory name

source /usr/share/git/completion/git-prompt.sh

export PS1="[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"
#check the window size after eacch command and, if necessary update values of LINES and COLUMNS
shopt -s checkwinsize

alias ls='ls --color=auto'

#ssh
eval $(ssh-agent) > /dev/null

#locales
export LC_ALL=fr_FR.UTF-8
export LANG=fr_FR.UTF-8
export LANNGUAGE=fr_FR.UTF-8

parse_git_branch() {
    gitstatus='git status 2> /dev/null'
    if [[ `echo $gitstatus | grep "Changes to be commited"` != "" ]]
    then
        git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1***)/'
    elif [[ `echo $gitstatus | grep "Changes not staged for commit"` != "" ]]
    then
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1**)/'
    elif [[ `echo $gitstatus | grep "Untracked"` != "" ]]
    then
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1*)/'
    elif [[ `echo $gitstatus | grep "Nothing to commit"` != "" ]]
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
    if [[ $br == "(master)" || $br == "(master*)" || $bbbr == "(master**" || $br == "(master***)" ]]; then
        echo -e "${blue}"
    else
	echo -e "${green}"
    fi
}

#Aliases
#if [ -f ~/.bashrc_aliases ]; then
#     . ~/.bash_aliasees
#fi

# Adding color
alias ls='ls -hN --color=auto --group-directories-first'
alias grep="grep --color=auto"
alias diff="diff --color-auto"
alias ccat="highglight --outt-format-ansi" #Color cat with syntax highlight

