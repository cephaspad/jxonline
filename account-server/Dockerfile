FROM scottyhardy/docker-wine

RUN apt-get update
RUN apt-get install -y winbind

ENV DISPLAY=192.168.1.61:0.0
ENV WINEARCH=win32
ENV WINEPREFIX=/home/wineuser/.win32
RUN winetricks mdac28

WORKDIR /app
COPY account-server/paysyswin /app

ENTRYPOINT ["/usr/bin/bash"]