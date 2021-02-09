FROM ubuntu:latest
ENV TZ=Europe/Kiev
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update
RUN apt-get install -y wget
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN apt install -y ./google-chrome-stable_current_amd64.deb
RUN rm google-chrome-stable_current_amd64.deb
RUN apt-get install -y xfce4 dbus-x11 --no-install-recommends
RUN apt-get install -y x11vnc xvfb xfwm4
RUN apt-get install -y xfce4-notifyd
ADD bootstrap.sh /root/bootstrap.sh
ADD listener.py /root/listener.py
ENTRYPOINT ["/bin/bash", "/root/bootstrap.sh"]
