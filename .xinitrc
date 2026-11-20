xrandr --output HDMI1 --primary --auto --output eDP1 --auto --left-of HDMI1

systemctl --user import-environment DISPLAY XAUTHORITY
dbus-update-activation-environment --systemd DISPLAY XAUTHORITY

systemctl --user start graphical-session.target

exec i3
