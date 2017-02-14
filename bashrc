# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
export HISTCONTROL=ignoreboth

export HISTFILESIZE=4056
export HISTSIZE=4056
export HISTIGNORE="&:l:[bf]g:exit"
export HISTTIMEFORMAT='%F %T '

export BASH_ENV=".nonInteractive"


if [ -f ~/.bash_aliases ]; then
    xmodmap ~/.xmodmap-`uname -n`
fi


#!/bin/bash
#----------------------------------------------------------------------
#       POWER USER PROMPT "pprom2"
#----------------------------------------------------------------------
#
#   copyright 2007 Giles Orr
#   Placed under the Gnu Public License v.3
#

function prompt_command
{
#      This is used to calculate the differential in load values
#      provided by the "uptime" command.  "uptime" gives load 
#      averages at 1, 5, and 15 minute marks.  The HERE document
#      is needed because "read" won't take data from subprocesses
#      in a pipe.  "fifteen" is unused but available.
#
local one
local five
read one five fifteen << HERE
  $(uptime | sed -e "s/.*load average: \(.*\...\), \(.*\...\), \(.*\...\)/\1 \2 \3/")
HERE
loaddiff=$(echo -e "scale = scale ($one) \nx=$one - $five\n {print $one} \n if (x>0) {print \"^\", x} else {print \"v\", -x}\nquit \n" | bc)

#   Count visible files:
let files=$(ls -l | grep "^-" | wc -l | tr -d " ")
let hiddenfiles=$(ls -l -d .* | grep "^-" | wc -l | tr -d " ")
let executables=$(ls -l | grep ^-..x | wc -l | tr -d " ")
let directories=$(ls -l | grep "^d" | wc -l | tr -d " ")
let hiddendirectories=$(ls -l -d .* | grep "^d" | wc -l | tr -d " ")-2
let linktemp=$(ls -l | grep "^l" | wc -l | tr -d " ")
if [ "$linktemp" -eq "0" ]
then
    links=""
else
    links=" ${linktemp}l"
fi
unset linktemp
let devicetemp=$(ls -l | grep "^[bc]" | wc -l | tr -d " ")
if [ "$devicetemp" -eq "0" ]
then
    devices=""
else
    devices=" ${devicetemp}bc"
fi
unset devicetemp

}

PROMPT_COMMAND=prompt_command

function pprom2 {

local BLUE="\[\033[0;34m\]"
local LIGHT_GRAY="\[\033[0;37m\]"
local LIGHT_GREEN="\[\033[1;32m\]"
local LIGHT_BLUE="\[\033[1;34m\]"
local LIGHT_CYAN="\[\033[1;36m\]"
local YELLOW="\[\033[1;33m\]"
local WHITE="\[\033[1;37m\]"
local RED="\[\033[0;31m\]"
local BLACK="\[\033[0m\]"

case $TERM in
    xterm*|rxvt*)
        TITLEBAR='\[\033]0;\u@\h:\w\007\]'
        ;;
    *)
        TITLEBAR=""
        ;;
esac

PS1="$TITLEBAR\
$LIGHT_GRAY[\
$LIGHT_GRAY\${files}//.\${hiddenfiles}//\
$LIGHT_GREEN\${executables} \
$LIGHT_GRAY\$(lsbytesum.sh) \
$LIGHT_GRAY][\w$LIGHT_GRAY]\
\n\
$LIGHT_GRAY[$BLACK\D{%F %T}$LIGHT_GRAY]\
$LIGHT_GRAY[$YELLOW\u@\h$LIGHT_GRAY]\
$WHITE\\n->\
\
$BLACK "
PS2='continue---> '
PS4='+ '
}

pprom2

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

alias l="ls -lFhX --color"

alias whis="history -w"
alias rhis="history -r"
alias ghis="history | grep "


alias lemacsClient='emacsclient -t'

alias emacsClient='emacsclient -c'

export PATH=$PATH:/usr/brlcad/bin/:~/Scripts

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -l'
#alias la='ls -A'
alias l='ll -FhX'

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
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

setxkbmap -option ctrl:nocaps
