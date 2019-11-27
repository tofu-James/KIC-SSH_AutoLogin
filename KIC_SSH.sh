#!/bin/bash
script=KIC_SSH
ext=sh
OS=$(uname)
file=$ext" "$script"-"$OS.$ext
if [ $OS == "Linux" ]; then
    DE=$XDG_CURRENT_DESKTOP
    LOCATE=$(dirname $(readlink -f $BASH_SOURCE)) 
    if [ $DE == "KDE" ] ;then
        konsole --workdir $LOCATE -e $file
    elif [ $DE == "GNOME" ];then
        gnome-terminal --working-directory $LOCATE -e $file
    else xterm -e "cd $LOCATE && $ext $file"
    fi
elif [ $OS == "Darwin" ]; then
    osascript -e 'tell application "Terminal"
    activate
        do script "\"$file\"" in window 1
    end tell'
else echo "NOT SUPPORTED"
fi