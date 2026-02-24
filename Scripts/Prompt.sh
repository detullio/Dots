
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
$LIGHT_GRAY[$BLACK\u@\h$LIGHT_GRAY]\
$WHITE\\n->\
\
$BLACK "
PS2='continue---> '
PS4='+ '
}

pprom2
