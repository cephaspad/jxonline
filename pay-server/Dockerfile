FROM scottyhardy/docker-wine

ARG DISPLAY=host.docker.internal:0.0

RUN apt-get update
RUN apt-get install -y winbind xvfb

COPY config/ /config

ENV WINEARCH=win32
ENV WINEPREFIX=/root/.win32
ENV GNUTLS_SYSTEM_PRIORITY_FILE=/config/priorityGNU

# (Required) should provide as --build-arg when building
ENV DISPLAY=$DISPLAY
RUN winetricks mdac28

WORKDIR /app
COPY apps/paysyswin/ .

ENTRYPOINT ["/usr/bin/wine", "Sword3PaySys.exe"]