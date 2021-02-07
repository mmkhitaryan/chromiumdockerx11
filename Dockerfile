FROM ubuntu:latest
ENV TZ=Europe/Kiev
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update
RUN apt-get install -y wget
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN apt install -y ./google-chrome-stable_current_amd64.deb
RUN rm google-chrome-stable_current_amd64.deb
RUN apt-get install -y xvfb x11vnc dbus-x11
ADD bootstrap.sh /root/bootstrap.sh
ENTRYPOINT ["/bin/bash", "/root/bootstrap.sh"]
