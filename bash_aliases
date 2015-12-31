#if you are on mac os x use GNU installed by homebrewls instead of BSD one
unamestr="`uname`"
if [ "$unamestr" == "Darwin" ]; then
    alias ls='gls --color=auto'
    alias dir='gdir --color=auto'
    alias vdir='gvdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'


# if you use MacOS X use mvim in textmode instead of vim
    alias vim='mvim -v'
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
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
alias spacestoanderscore='ls | while read -r file; do mv "$file" `echo $file | tr " " "_" `; done'

# some vim like aliases
:e()
{
    vim "$@"
}
alias :q='exit'
