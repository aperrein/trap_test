# Script to delete all files and pictures, after to reset the original background of the victim.

# Reset the backgound with $WALLPAPER environnment value
gsettings set org.gnome.desktop.background picture-uri $WALLPAPER

# Deleting all file create by the script
rm ~/goinfre/dontdeleteme.sh
rm ~/goinfre/minimize_windows
rm ~/Pictures/rick.jpg

#Delete the 'cd' alias
sed -i '$ d' ~/.zshrc

# Reset the screen to original position
xrandr -o 0

# Delete the save file and restart the actual terminal
rm save.sh
clear
exec zsh -l
