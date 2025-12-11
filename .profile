# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi


### Uncomment with caution. Not sure of consequences!
# set PATH so it includes user's private bin if it exists
#if [ -d "$HOME/bin/sh" ] ; then
#    PATH="$HOME/bin/sh:$PATH"
#fi


# Inserted by uv-installer script:
# ********************************
. "$HOME/.local/share/../bin/env"


# Added to stop gtk blabber stuff like:
# "Gtk-Message:..: GtkDialog mapped without a transient parent. This is discouraged."
# Adwaita-WARNING **: 23:00:41.729: No known Yaru accent 'MATE'
# *************************************************************
GTK_SILENT=1


# Delete any and all .bash_history-12345.tmp files.
# **************************************************************
rm --interactive=never /home/xneb/.bash_history-*.tmp