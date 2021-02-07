Xvfb -ac :99 -screen 0 1000x1000x16 &
export DISPLAY=:99
google-chrome --no-sandbox --window-position=0,0 --window-size=900,700 &
x11vnc -nopw -forever
