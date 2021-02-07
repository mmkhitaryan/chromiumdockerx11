x11vnc -create -env FD_PROG=/usr/bin/startxfce4 \
    -env X11VNC_FINDDISPLAY_ALWAYS_FAILS=1 \
        -env X11VNC_CREATE_GEOM=${1:-1024x768x16} \
        -gone 'killall Xvfb' \
        -nopw -forever
