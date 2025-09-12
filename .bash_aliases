
####--- Some useful ls flags ---####
#   -A  --almost-all            hides . and ..
#   -G  --no-group              in a long listing, don't print group names (xneb xneb => xneb)
#   -h  --human-readable        file sizes
#   -N  --literal               skriv ut råa postnamn utan citeringar
#   -p  --indicator-style=slash
#   #-v                         natural sort of (version) numbers within text.
#                               (Lists dotfiles first, and (within groups) Upper-case first.
#                               Also misses UTF8)

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

    alias ls='ls --color=auto'
    alias dir='ls -AGhlNpv --group-directories-first'
    alias ddd='dir --time-style=iso'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi


# some more ls aliases
# --------------------
alias ll='ls -aGl'
alias lll='ls -aFGl --group-directories-first'
alias la='ls -A'
alias l='ls -CF'
alias lasort='la --group-directories-first'

# Show octal permissions (cp lsdx/lsd- aliases below)
alias ls8="ls -l | awk '{k=0;for(i=0;i<=8;i++)k+=((substr(\$1,i+2,1)~/[rwx]/)*2^(8-i));if(k)printf(\"%0o\",k);print}'"

alias cl=clear
alias rm="rm -i"            # safety first
alias p3='python3'
alias tree='tree -aC'       # Caution! Runaway output if called from high hiarchy levels
alias ..="cd .."            # go up
alias ...="cd .. ; cd .."   # go up-up

#alias - --="cd -"           # "--" = return to OLDPWD (if set)
###
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
### in sequence like so:
###         "unalias - 2>/dev/null && source .bash_aliases".
### That finally stopped bash from trying to look for the nonexistant alias.
###
### So, better refrain from trying that again.


# Show history top-40 list, sorted by popularity
alias nyss="cd ~/bin/sh/; ./history_unique_commands.sh"

# Watch the syslog-tail
alias systail='tail -f /var/log/syslog'

# Check if our DNS is still uptodate
alias testip='cd ~/bin/sh/; ./ip-test_notify-send.sh'

# Add an "alert" alias for long running commands.  
# Use like so:  sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'


# ---------------------------------------------------------------------------------------------------
#            === LSD ===		  (cp ~/.config/lsd/config.yaml for "permanent" lsd settings)

####--- Some useful lsd flags ---####
#  -a, --all                      Do not ignore entries starting with
#  -l, --long                     Display extended file metadata as a table
#  -1, --oneline                  Display one entry per line
#  -R, --recursive                Recurse into directories
#      --tree                     Recurse into directories and present the result as a tree
#      --depth <NUM>              Stop recursing into directories after reaching specified depth
#  -d, --directory-only           Display directories themselves, and not their contents (recursively when used with --tree)
#      --permission <MODE>        How to display permissions [default: rwx] [possible values: rwx, octal]
#      --size <MODE>              How to display size [default: default] [possible values: default, short, bytes]
#      --total-size               Display the total size of directories
#      --date <DATE>              How to display date [default: date] [possible values: date, relative, +date-time-format]
#  -t, --timesort                 Sort by time modified
#  -S, --sizesort                 Sort by size
#  -X, --extensionsort            Sort by file extension
#  -v, --versionsort              Natural sort of (version) numbers within text
#  -U, --no-sort                  Do not sort. List entries in directory order
#  -r, --reverse                  Reverse the order of the sort
#      --group-directories-first  Groups the directories at the top before the files. Same as --group-dirs=first

alias lsdx='lsd --almost-all --long --permission octal --date +%y%m%d,%X --group-directories-first --total-size'
alias lsd-='lsd --almost-all --long --permission octal --date +%y%m%d,%X --group-directories-first --total-size --color never'


