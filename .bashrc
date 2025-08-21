# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
# ***********************************************
case $- in
    *i*) ;;
      *) return;;
esac


# don't put duplicate lines or lines starting with space in the history.
# **********************************************************************
# See bash(1) for more options
HISTCONTROL=ignoreboth


# append to the history file, don't overwrite it.
# ***********************************************
shopt -s histappend


# For setting history length see HISTSIZE and HISTFILESIZE in bash(1).
# ********************************************************************
HISTSIZE=1000
HISTFILESIZE=2000


# Check the window size after each command, and, if necessary,
# *****************************************
# update the values of LINES and COLUMNS.
shopt -s checkwinsize


# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar


# Make less more friendly for non-text input files, see lesspipe(1)
# *****************************************************************
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"


# Set variable identifying the chroot you work in (used in the prompt below)
# **************************************************************************
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi


###>>>### export TERM=xterm-256color


# Set a fancy prompt (non-color, unless we know we "want" color)
# **************************************************************
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac


# Uncomment for a colored prompt, if the terminal has the capability; 
# *******************************************************************
#turned off by default to not distract the user: the focus in a
# terminal window should be on the output of commands, not on the prompt.
###>>>### force_color_prompt=yes


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


# BACKUP AV FUNGERANDE KONFIG UTAN RADBRYTNINGAR I PROMPTEN:
# ****************************----**************************
###>>>### if [ "$color_prompt" = yes ]; then
###>>>###    PS1='${debian_chroot:+($debian_chroot)}\[\033[00;31m\]\u\[\033[01;33m\]@\[\033[00;33m\]\h\[\033[00m\]:\[\033[01;33m\]\w\[\033[00m\]\$ '

#  FUNGERANDE KONFIG MED RADBRYTNINGAR:
# *************************************
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\n\[\033[00;31m\]\u\[\033[01;33m\]@\[\033[00;33m\]\h\[\033[00m\]:\[\033[01;33m\]\w\[\033[00m\]\[\e[0m\]\n$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt


# If this is an xterm set the title to user@host:dir
# **************************************************
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac


## Colored GCC warnings and errors 
#  *******************************
#  export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'


# Alias definitions.
# ******************
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi


# Enable programmable completion features 
# ***************************************
# (you don't need to enable this, if it's already enabled in
# /etc/bash.bashrc and /etc/profile sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


# Make Tab autocomplete regardless of filename case
set completion-ignore-case on

# List all matches in case multiple possible completions are possible
set show-all-if-ambiguous on

# Immediately add a trailing slash when autocompleting symlinks to directories
set mark-symlinked-directories on

# Be more intelligent when autocompleting by also looking at the text after
# the cursor. For example, when the current line is "cd ~/src/mozil", and
# the cursor is on the "z", pressing Tab will not autocomplete it to "cd
# ~/src/mozillail", but to "cd ~/src/mozilla". (This is supported by the
# Readline used by Bash 4.)
set skip-completed-text on

# Allow UTF-8 input and output, instead of showing stuff like $'\0123\0456'
set input-meta on
set output-meta on
set convert-meta off


# Define standard directories.
# ****************************
declare -gx XDG_CACHE_HOME=~/.cache
declare -gx XDG_CONFIG_HOME=~/.config
declare -gx XDG_DATA_HOME=~/.local/share

export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}



# Setting PYTHONPATH. ##################################################
# ===================
#
# The following 4 addresses are actually picked up by default by Python
# *********************************************************************
# /usr/lib/python3/dist-packages                  #   (817 obj)
# /usr/lib/python3.12                             #   (202 obj)
# /usr/lib/python3.12/lib-dynload                 #   ( 48 obj)
# /usr/local/lib/python3/dist-packages            #   (>3.12=Tom mapp)
#
# Adding non-standard modules directories to PYTHONPATH:
# The following 4 addresses are NOT picked up by default!
# ******************************************************
#export PYTHONPATH=${PYTHONPATH}:"/home/xneb/.local/lib/python3.8/site-packages"
#export PYTHONPATH=${PYTHONPATH}:"/home/xneb/.local/lib/python3/site-packages"
#export PYTHONPATH=${PYTHONPATH}:"/home/xneb/.local/lib/python2.7/site-packages"
#export PYTHONPATH=${PYTHONPATH}:"/home/xneb/bin/python-apps-modules-packages/py3"


##  DO NOT SET PYTHONPATH DIRECTLY. Instead do this:
##  Find the per user site-packages directory. Start python and run:
##  
##  	>>> import site
##  	>>> site.getusersitepackages()
##  
##  This shows the path to the directory.
##  In this directory, create a file named usercustomize.py. 
##  In this file add code:
##  
##  	# usercustomize.py
##  	import sys
##  	sys.path.extend(['/home/.../.../',])
##
########################################################################


# Inserted by uv-installer script:
# ********************************
. "$HOME/.local/share/../bin/env"


# Enable shell autocompletion for uv and uvx commands
# ***************************************************
# ▶ Because generate-shell-completion was not found in the package registry
#	and you require generate-shell-completion, we can conclude that your
#	requirements are unsatisfiable.

#eval "$(uv generate-shell-completion bash)"
#eval "$(uvx generate-shell-completion bash)"



# Broot-launcher
# **************
##Holdback##source /home/xneb/.config/broot/launcher/bash/br
source /home/xneb/.config/broot/launcher/bash/br

