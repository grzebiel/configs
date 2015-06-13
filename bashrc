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

export PS1='\[\033[01;037m\]$\[\033[00m'
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -lh'
alias la='ls -A'
alias l='ls -CF'
alias lla='ls -lA'
alias ..='cd ..; pwd; ls'
alias ...='cd ../..; pwd; ls'
alias ....='cd ../../..; pwd; ls'
alias .....='cd ../../../..; pwd; ls'
alias ......='cd ../../../../..; pwd; ls'
alias .......='cd ../../../../../..; pwd; ls'
alias cd..='cd ..; pwd'
alias vman='~/.vim/vimman.sh'
alias spacestoanderscore='ls | while read -r file; do mv "$file" `echo $file | tr " " "_" `; done'

# if you use MacOS X use mvim in textmode instead of vim
if [[ "$unamestr" ]];
then
    alias vim='mvim -v'
fi

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
#random quote
fortune -a
echo -e "\n"

#Display error codes
EC() { echo -e '\e[1;33m'code $?'\e[m\n'; }
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
export PATH=~/bin:$PATH

#cd history
source ~/.adc_func.sh

#rhapsody license
export LM_LICENSE_FILE=27010@eseelic60.emea.nsn-net.net:27009@eseelic60.emea.nsn-net.net:27014@eseelic60.emea.nsn-net.net:27013@eseelic51.emea.nsn-net.net:27013@eseelic60.emea.nsn-net.net:27009@eseelic51.emea.nsn-net.net:27009@eseelic60.emea.nsn-net.net:27009@beeelic60.china.nsn-net.net


#vim as man viewer
export MANPAGER="/bin/sh -c \"unset PAGER;col -b -x | \
    vim -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>' \
    -c 'map <SPACE> <C-D>' -c 'map b <C-U>' \
    -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""
