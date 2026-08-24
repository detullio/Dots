#s ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

export PATH="$HOME/Scripts:$HOME/.local/bin:$PATH"

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
# export HISTCONTROL=ignoreboth:erasedups

# append to the history file, don't overwrite it
shopt -s histappend
shopt -s histverify #enter history on command line, but do not execute

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
export HISTSIZE=10000
export HISTFILESIZE="$HISTSIZE"

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# # uncomment for a colored prompt, if the terminal has the capability; turned
# # off by default to not distract the user: the focus in a terminal window
# # should be on the output of commands, not on the prompt
# force_color_prompt=yes

# if [ -n "$force_color_prompt" ]; then
#     if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
# 	# We have color support; assume it's compliant with Ecma-48
# 	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
# 	# a case would tend to support setf rather than setaf.)
# 	color_prompt=yes
#     else
# 	color_prompt=
#     fi
# fi

# enable colored prompt for git branches
# using parse_git_branch
parse_git_branch() {
 git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

#if [ "$color_prompt" = yes ]; then
#    PS1="\n \[\033[2;30m\]\u@\h:\$(/usr/bin/tty | /bin/sed -e 's:dev/::') \w\n\$(parse_git_branch)\n\[\033[2;37m\]\$(/bin/date +"%Y%m%d::%H:%M:%S")> > >\[\033[0m\]"
#    PS1="\n\[\033[2;37m\]\$(/bin/date +"%Y%m%d::%H:%M:%S")\n\[\033[2;37m\]\w\n\[\033[1;30m\]\u@\h: \[\033[1;36m\]\$(/usr/bin/tty | /bin/sed -e 's:/dev/::')> \[\033[0m\]"
# else
#     PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
# fi
# unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
# case "$TERM" in
# xterm*|rxvt*)
#     PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
#     ;;
# *)
#     ;;
# esac
GRAY="\[$(tput setaf 242)\]"
RESET="\[$(tput sgr0)\]"
PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h:\w\a\]\n${GRAY} \u@\h:\$(/usr/bin/tty | /bin/sed -e 's:dev/::') \w\n\$(parse_git_branch)\n\[\033[2;37m\]\$(/bin/date +"%Y%m%d::%H:%M:%S")> > >\[\033[0m\]"
#PS1="\n ${GRAY}\u@\h:\$(/usr/bin/tty | /bin/sed -e 's:dev/::') \w\n${RESET}$(parse_git_branch)\n\[\033[2;37m\]\$(/bin/date +"%Y%m%d::%H:%M:%S")> > >\[\033[0m\]"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

export GREP_COLORS='ms=01:mc=01;31:sl=:cx=:fn=0:ln=32:bn=32:se=36'

# some more ls aliases
alias l='ls -lFhX'

alias qmacs='emacs -nw -q'

# Connect to OrgHell daemon (GUI if display available, else terminal)
eorg() {
    if [ -n "$DISPLAY" ] || [ -n "$WAYLAND_DISPLAY" ]; then
        emacsclient -s OrgHell -c -n "$@"
    else
        emacsclient -s OrgHell -nw "$@"
    fi
}

# Connect to system daemon (GUI if display available, else terminal)
esys() {
    if [ -n "$DISPLAY" ] || [ -n "$WAYLAND_DISPLAY" ]; then
        emacsclient -s system -c -n "$@"
    else
        emacsclient -s system -nw "$@"
    fi
}
alias emacs-org='eorg'
alias emacs-sys='esys'

alias ghis='history|grep'
alias whis='history -w'
alias rhis='history -r'
alias rm='trash'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

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

if [ -x ~/.Xmodmap ]; then
   xmodmap ~/.Xmodmap
fi

# source /home/kdetullio3/miniconda3/etc/profile.d/conda.sh  # commented out by conda initialize
# conda activate  # commented out by conda initialize

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/kmdetullio/miniforge3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/kmdetullio/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/home/kmdetullio/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/home/kmdetullio/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

source /home/kmdetullio/working/developing/ardupilot/ardupilot/Tools/completion/completion.bash

# =============================================================================
# Advanced History Management: Deduplicate, merge, and synchronize history
# from multiple shell sessions while maintaining command order
# =============================================================================

# History lock file path (stored in tmpfs for performance)
_HIST_LOCK_FILE="${HISTFILE}.lock"

# Function to cleanup stale lock files
_cleanup_stale_locks() {
    local lockfile="$1"
    # Remove lock file if it's older than 1 hour (stale from crashed process)
    if [ -f "$lockfile" ]; then
        local age=$(($(date +%s) - $(stat -c %Y "$lockfile" 2>/dev/null || echo 0)))
        if [ "$age" -gt 3600 ]; then
            rm -f "$lockfile"
        fi
    fi
}

# Function to deduplicate history keeping MOST RECENT occurrence
_deduplicate_history() {
    local histfile="$1"
    if [ ! -f "$histfile" ] || [ ! -s "$histfile" ]; then
        return
    fi
    
    # Use tac to reverse, deduplicate, then reverse back to keep MOST RECENT
    local tmpfile="${histfile}.dedup.tmp"
    tac "$histfile" | awk -F'\n' '!seen[$0]++' | tac > "$tmpfile" && mv "$tmpfile" "$histfile"
}

# Function to merge history from all bash sessions with proper locking
_merge_history() {
    local histfile="$HISTFILE"
    local lockfile="$_HIST_LOCK_FILE"
    
    # Cleanup any stale locks first
    _cleanup_stale_locks "$lockfile"
    
    # Use a single lock with blocking wait, not non-blocking
    {
        # Acquire exclusive lock (blocking until available)
        flock -x 9
        
        # Read current history file
        local current_lines=""
        if [ -f "$histfile" ]; then
            current_lines=$(cat "$histfile")
        fi
        
        # Get this session's history (non-persistent commands)
        local session_lines
        session_lines=$(history -p 2>/dev/null | grep -v '^$' | tr '\n' '\x00' | xargs -0 -n1 echo | tail -n 50)
        
        # Combine and deduplicate (keeping most recent)
        {
            echo "$current_lines"
            echo "$session_lines"
        } | tac | awk -F'\n' '!seen[$0]++' | tac > "${histfile}.new"
        
        # Atomic replace
        if [ -f "${histfile}.new" ]; then
            mv "${histfile}.new" "$histfile"
        fi
        
        # Release lock implicitly when block exits
    } 9>"$lockfile"
}

# Pre-command hook to sync history before each command
_sync_history_on_exec() {
    # Only sync if the history file exists and has content
    if [ -f "$HISTFILE" ] && [ -s "$HISTFILE" ]; then
        _merge_history
    fi
}

# Post-command hook to sync history after each command
_sync_history_after_exec() {
    # Force write current session history to file
    history -a
    
    # Merge and deduplicate
    if [ -f "$HISTFILE" ]; then
        _merge_history
    fi
}

# Set up the history sync hooks
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND;}_sync_history_after_exec"

# Also sync before command execution to catch history from other sessions
# Use DEBUG trap as a lightweight alternative to PROMPT_COMMAND for pre-command sync
# Only enable if not already set to avoid overhead
if [[ -z "$BASH_HISTORY_SYNC_DEBUG" ]]; then
    export BASH_HISTORY_SYNC_DEBUG=1
    trap '_sync_history_on_exec' DEBUG
fi

# Periodic background history sync (every 10 commands for more frequent updates)
_history_periodic_sync() {
    local count="${BASH_HISTORY_SYNC_COUNT:-0}"
    ((count++))
    export BASH_HISTORY_SYNC_COUNT=$count
    
    # Sync every 10 commands to catch history from other sessions
    if [ $((count % 10)) -eq 0 ]; then
        _merge_history
    fi
}

# Add periodic sync to prompt command
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND;}_history_periodic_sync"

# Cleanup lock file on shell exit to prevent stale locks
_cleanup_history_on_exit() {
    local lockfile="$_HIST_LOCK_FILE"
    # Only remove if we created it and it's stale
    if [ -f "$lockfile" ]; then
        rm -f "$lockfile" 2>/dev/null
    fi
}

# Function to manually trigger a full history sync and deduplication
hist-sync() {
    echo "Syncing and deduplicating history..."
    _merge_history
    _deduplicate_history "$HISTFILE"
    history -r
    echo "History sync complete. Total entries: $(wc -l < "$HISTFILE")"
}

# Function to show history statistics
hist-stats() {
    if [ -f "$HISTFILE" ]; then
        echo "History file: $HISTFILE"
        echo "Total entries: $(wc -l < "$HISTFILE")"
        echo "Unique entries: $(tac "$HISTFILE" | awk -F'\n' '!seen[$0]++' | tac | wc -l)"
        echo "File size: $(du -h "$HISTFILE" | cut -f1)"
    fi
}

# Aliases for history management
alias hsync='hist-sync'
alias hstats='hist-stats'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
