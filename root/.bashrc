# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

##### **************************************************************************
#####           /root/.bashrc [FOR ROOT]   version 2025-09-06
##### **************************************************************************


# If not running interactively, don't do anything
[ -z "$PS1" ] && return

################################## VARIA #######################################

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

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

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

################################ PROMPTING #####################################

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

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

if [ "$color_prompt" = yes ]; then
#   PS1='${debian_chroot:+($debian_chroot)}\n\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    PS1='${debian_chroot:+($debian_chroot)}\n\[\033[01;31m\]\u@\h:\[\033[00;34m\]\w\[\033[01;31m\]\n\$ \[\033[00m\]\[\e[0m\]'
else
#   PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:hullo-\w\$ '
fi
unset color_prompt force_color_prompt



# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

################################# ALIASES ######################################

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'
    alias dir='ls -AGhlNpv --group-directories-first'
    alias ddd='dir --time-style=iso'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias lll='ls -aFGl --group-directories-first'
alias la='ls -A'
alias l='ls -CF'

alias cl=clear
alias p3='python3'
alias ..="cd .."            # go up
alias ...="cd .. ; cd .."   # go up-up

### Any alias-names exclusevily using hyphens (minus-signs) is a "dangerous"!
### Such aliases can't be completely unaliased and forgotten, it seems. 
###
### If an attempt has been made to unalias and/or deleting an alias in
### the relevant startup file, opening a new terminal will then make it
### start complaining that "bash: alias: -: not found"
### ('bash: alias: -: finns inte'). 
###
### Trying to source .bashrc simply returns the same error, while not
### actually sourcing or refreshing the aliases in memory.
###
### Furthermore emitting e.g. "unalias - 2>/dev/null; true",
### (https://unix.stackexchange.com/questions/212493/bash-unalias-ls-not-found)
### also had no effect (by itself).
###
### The solution for us was to combine the two commands so that they executed
### in sequence like so: "unalias - 2>/dev/null && source .bash_aliases".
### That finally stopped bash from trying to look for the nonexistant alias.
###
### So, better refrain from trying that again.

# alias - --="cd -"           # "--" = return to OLDPWD (if set)



# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

# if [ -f ~/.bash_aliases ]; then
#     . ~/.bash_aliases
# fi

################################################################################


. "$HOME/.local/bin/env"
