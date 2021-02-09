service dbus start
x=$(dbus-launch)
export $x
echo $x | tr '\0' '\n'
Xvfb -ac :99 -screen 0 1000x1000x16 &
export DISPLAY=:99
/usr/lib/x86_64-linux-gnu/xfce4/notifyd/xfce4-notifyd &
google-chrome --no-sandbox --window-position=0,0 --window-size=900,700 --disable-gpu https://web-push-book.gauntface.com/demos/notification-examples/ &
dbus-monitor &
x11vnc -nopw -forever

