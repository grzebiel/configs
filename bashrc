# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

#detect os
unamestr=`uname`

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes
if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

export PS1='$(git_ps)\[\033[01;037m\]$\[\033[00m'
unset color_prompt force_color_prompt

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#my favorite quotes
echo -e "He who knows that enough is enough will always have enough\n\t-- Lao Tsu"
echo -e "Much of the excitement we get out of our work is that we don't really\nknow what we are doing.\n\t-- E. Dijkstra"
echo -e "Don't let schooling interfere  with your education\n\t-- M. Twain \n\n"
echo -e "Arguing that you don't care about the right to privacy because you have nothing to hide is no different than saying you don't care about free speech because you have nothing to say \n\t-- Edward Snowden"
#random quote
fortune -a
echo -e "\n"

#Display error codes
EC() { printf '\e[1;33mcode %d\e[m\n' $?; }
trap EC ERR

# cd and ls in one
cl() {
    cd "$1"
    ls
}

cll() {
    cd "$1"
    ll
}
cla() {
    cd "$1"
    la
}
clla() {
    cd "$1"
    lla
}

#proxy
#export http_proxy="http://10.144.1.10:8080"
#export https_proxy="https://10.144.1.10:8080"
#export ftp_proxy="ftp://10.144.1.10:8080"

#custom scripts location added to path
export PATH=~/configs/bin:~/bin:$PATH

#cd history
source ~/.adc_func.sh

#vim as man viewer
export MANPAGER="/bin/sh -c \"unset PAGER;col -b -x | \
    vim -R -c 'set ft=man nomod nolist nonumber' -c 'map q :q<CR>' \
    -c 'map <SPACE> <C-D>' -c 'map b <C-U>' \
    -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""

#Go environment
export GOPATH=~/workspace/go/

#fuzzy finder for bash (fzf https://github.com/junegunn/fzf) extension
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

#more readable colors of dirs in ls colorized output
export LS_COLORS=$LS_COLORS:'di=0;35:'
eval alias fuck='TF_CMD=$(TF_ALIAS=fuck PYTHONIOENCODING=utf-8 TF_SHELL_ALIASES=$(alias) thefuck $(fc -ln -1)) && eval $TF_CMD && history -s $TF_CMD'


#print my tasks
if [ $(which task) != "" ]
then
    task list
fi
