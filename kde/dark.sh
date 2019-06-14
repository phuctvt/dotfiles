#!/usr/bin/bash

if [ -r "$HOME/.dbus/Xdbus" ]; then
  . "$HOME/.dbus/Xdbus"
fi

# qt
lookandfeeltool --apply MyDark
kwriteconfig5 --file ~/.config/kwinrc --group TabBox --key LayoutName big_icons
qdbus org.kde.KWin /KWin org.kde.KWin.reconfigure

## gtk
gsettings set org.gnome.desktop.interface gtk-theme 'Breeze-Dark'
gsettings set org.gnome.desktop.interface cursor-theme 'breeze_cursors'
kwriteconfig5 --file ~/.config/gtk-3.0/settings.ini --group Settings --key gtk-theme-name Breeze-Dark
kwriteconfig5 --file ~/.config/gtk-3.0/settings.ini --group Settings --key gtk-cursor-theme-name breeze_cursors

## konsole
konsoleprofile "colors=Solarized Dark Blur"
kwriteconfig5 --file ~/.local/share/konsole/Current\ Profile.profile --group Appearance --key ColorScheme 'Solarized Dark Blur'

## wallpaper
dbus-send --session --dest=org.kde.plasmashell --type=method_call /PlasmaShell org.kde.PlasmaShell.evaluateScript 'string:
var Desktops = desktops();                                                                                                                       
for (i=0;i<Desktops.length;i++) {
        d = Desktops[i];
        d.wallpaperPlugin = "org.kde.image";
        d.currentConfigGroup = Array("Wallpaper",
                                    "org.kde.image",
                                    "General");
        d.writeConfig("Image", "file:///home/leo/dotfiles/kde/dark.jpg");
}'

## splash
cp /home/leo/dotfiles/kde/dark.jpg ~/.local/share/plasma/look-and-feel/MyDark/contents/splash/images/test.jpg

## lockscreen wall
kwriteconfig5 --file ~/.config/kscreenlockerrc --group Greeter --group Wallpaper --group org.kde.image --group General --key Image file:///home/leo/dotfiles/kde/dark.jpg

## login wall
sudo cp /home/leo/dotfiles/kde/dark.jpg /usr/share/sddm/themes/plasma-chili/wall.jpg

## login cursor
sudo kwriteconfig5 --file /etc/sddm.conf --group Theme --key CursorTheme breeze_cursors

## success
notify-send -u low 'Applied the dark theme'
