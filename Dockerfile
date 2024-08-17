FROM ubuntu:24.04

RUN dpkg --add-architecture i386
RUN apt update
RUN apt upgrade -y
RUN apt install -y libuuid1:i386 libc6:i386 libstdc++6:i386
RUN apt install -y zenity xvfb dbus-x11 xterm
ENV DISPLAY=:99
ENV DBUS_SESSION_BUS_ADDRESS=/dev/null
ENV XDG_RUNTIME_DIR=/tmp
ENV XAUTHORITY=/tmp/.Xauthority
ENV XDG_SESSION_COOKIE=1
ENV GTK_A11Y=0

# WORKDIR /server/gateway
# RUN chmod +x goddess_y
# ENTRYPOINT ["sh", "-c", "Xvfb :99 -screen 0 1024x768x16 & export DISPLAY=:99 && export GTK_A11Y=none && ./goddess_y"]