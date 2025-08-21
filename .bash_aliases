
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
    
    alias dir='ls -lAGhNp --time-style=iso --group-directories-first'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
# --------------------
alias ll='ls -la'
alias lll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias lasort='la --group-directories-first'

# Show octal permissions
alias ls8="ls -l | awk '{k=0;for(i=0;i<=8;i++)k+=((substr(\$1,i+2,1)~/[rwx]/)*2^(8-i));if(k)printf(\"%0o\",k);print}'"
alias cl=clear
alias rm="rm -i"            # safety first
alias p3='python3'
alias tree='tree -aC'
alias ..="cd .."            # go up
alias ...="cd .. ; cd .."   # go up-up
alias -- -="cd -"

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
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

alias lsdx='lsd --almost-all --long --permission octal --date +%y-%m-%d,%X --group-directories-first --total-size --color never'



