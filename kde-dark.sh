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
kwriteconfig5 --file ~/.config/konsolerc --group 'Desktop Entry' --key DefaultProfile 'Leo Dark.profile'

## wallpaper
dbus-send --session --dest=org.kde.plasmashell --type=method_call /PlasmaShell org.kde.PlasmaShell.evaluateScript 'string:
var Desktops = desktops();                                                                                                                       
for (i=0;i<Desktops.length;i++) {
        d = Desktops[i];
        d.wallpaperPlugin = "org.kde.image";
        d.currentConfigGroup = Array("Wallpaper",
                                    "org.kde.image",
                                    "General");
        d.writeConfig("Image", "file:///home/leo/Dropbox/Wallpapers/lighter_hand_fire_111582_1920x1080.jpg");
}'

cp /home/leo/Dropbox/Wallpapers/lighter_hand_fire_111582_1920x1080.jpg ~/.local/share/plasma/look-and-feel/MyDark/contents/splash/images/test.jpg