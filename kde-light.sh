#!/usr/bin/bash

if [ -r "$HOME/.dbus/Xdbus" ]; then
  . "$HOME/.dbus/Xdbus"
fi

# qt
lookandfeeltool --apply MyLight
kwriteconfig5 --file ~/.config/kwinrc --group TabBox --key LayoutName big_icons
qdbus org.kde.KWin /KWin org.kde.KWin.reconfigure

## gtk
gsettings set org.gnome.desktop.interface gtk-theme 'Breeze'
gsettings set org.gnome.desktop.interface cursor-theme 'Breeze_Snow'
kwriteconfig5 --file ~/.config/gtk-3.0/settings.ini --group Settings --key gtk-theme-name Breeze
kwriteconfig5 --file ~/.config/gtk-3.0/settings.ini --group Settings --key gtk-cursor-theme-name Breeze_Snow

## konsole
konsoleprofile "colors=Solarized Light Blur"
kwriteconfig5 --file ~/.local/share/konsole/Current\ Profile.profile --group Appearance --key ColorScheme 'Solarized Light Blur'

## wallpaper
dbus-send --session --dest=org.kde.plasmashell --type=method_call /PlasmaShell org.kde.PlasmaShell.evaluateScript 'string:
var Desktops = desktops();                                                                                                                       
for (i=0;i<Desktops.length;i++) {
        d = Desktops[i];
        d.wallpaperPlugin = "org.kde.image";
        d.currentConfigGroup = Array("Wallpaper",
                                    "org.kde.image",
                                    "General");
        d.writeConfig("Image", "file:///home/leo/Dropbox/Wallpapers/daisies_flowers_field_111640_1920x1080.jpg");
}'

## splash
cp /home/leo/Dropbox/Wallpapers/daisies_flowers_field_111640_1920x1080.jpg ~/.local/share/plasma/look-and-feel/MyLight/contents/splash/images/test.jpg

## lockscreen wall
kwriteconfig5 --file ~/.config/kscreenlockerrc --group Greeter --group Wallpaper --group org.kde.image --group General --key Image file:///home/leo/Dropbox/Wallpapers/daisies_flowers_field_111640_1920x1080.jpg

## login wall
sudo cp /home/leo/Dropbox/Wallpapers/daisies_flowers_field_111640_1920x1080.jpg /usr/share/sddm/themes/plasma-chili/wall.jpg

## login cursor
sudo kwriteconfig5 --file /etc/sddm.conf --group Theme --key CursorTheme Breeze_Snow

## success
notify-send -u low 'Applied the light theme'


# -------------------
# Ref resources:
#   https://www.reddit.com/r/kde/comments/8207td/change_the_theming_based_on_the_time/
#   https://zren.github.io/2018/10/29/creating-a-new-plasma-look-and-feel
#   https://www.reddit.com/r/kde/comments/95ot5f/is_there_a_way_to_change_the_plasma_desktop_theme/