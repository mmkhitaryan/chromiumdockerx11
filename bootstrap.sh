service dbus start
export $(dbus-launch)
Xvfb -ac :99 -screen 0 1000x1000x16 &
export DISPLAY=:99
/usr/bin/startxfce4 &
/usr/lib/x86_64-linux-gnu/xfce4/notifyd/xfce4-notifyd &
google-chrome --no-sandbox --window-position=0,0 --window-size=900,700 --disable-gpu https://web-push-book.gauntface.com/demos/notification-examples/ &
x11vnc -nopw -forever
