#

## MATE-terminal profiles

**To backup settings and profiles:**
>     dconf dump /org/mate/terminal/ > path-to-filename.bkp 

**Or alternatively, adapt and run the shell script:**
>     ./"backup term-profile-settings.sh"

**To restore:**
>     dconf load /org/mate/terminal/ < path-to-filename.bkp
