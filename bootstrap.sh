Xvfb -ac :99 -screen 0 1280x720x16 &
export DISPLAY=:99
google-chrome --no-sandbox &
x11vnc -nopw
