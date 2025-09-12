#!/bin/bash

# Backup database of mate-terminal profiles v 0.1.0
# *************************************************


# 1) Get current date (ISO format, of course)
#
_now=$(date +"%x")



# 2) Append current date from $_now to a filename stored in $_file
#
_file="$HOME/gits/dotty-dotties/terminal_profiles/profiles.bkp_$_now.config"


# 3) Do it
#
echo "Starting backup to $_file..."
dconf dump /org/mate/terminal/ > "$_file"


