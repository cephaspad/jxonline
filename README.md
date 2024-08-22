# JX Online server

Operating system: Ubuntu 24.04 (Noble)

## Preparation
Before all steps, you have to login as `root`, and run the following command on your terminal
``` bash
apt update && apt install -y nano
```

### Database applications

1. Install mysql 5.7, mssql 2019
2. Restore database from `data-backups`


### Web management

1. Install [.NET 8 SDK](https://learn.microsoft.com/en-us/dotnet/core/install/linux-ubuntu-install?tabs=dotnet8&pivots=os-linux-ubuntu-2404#ubuntu-2404)
``` bash
apt update && apt install -y dotnet-sdk-8.0
```

2. Upload `jx-web-app` source code to `/jx/web-app-source`

3. Build `jx-web-app` to `/jx/web-app'

``` bash
cd /jx/web-app-source
dotnet publish ./jx-web-app.csproj -c Release -o /jx/web-app
```

4. Configure jx-web-app for [running automatically on boot](https://learn.microsoft.com/en-us/troubleshoot/developer/webapps/aspnetcore/practice-troubleshoot-linux/2-3-configure-aspnet-core-application-start-automatically)

Run this on your terminal
``` bash
systemctl enable /jx/web-app.service
```

5. Finally, run your web application
``` bash
sudo systemctl start jx-web-app.service
```

6. Login to your server by using `http://[your-ip]/`

### Account server

2. Install [Wine 9 Staging](https://wiki.winehq.org/Ubuntu)

``` bash
dpkg --add-architecture i386 
mkdir -pm755 /etc/apt/keyrings
wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/noble/winehq-noble.sources
apt update && apt install --install-recommends -y winehq-staging
rm -rf winehq.key
```

3. Install [Winetricks](https://github.com/Winetricks/winetricks)

``` bash
wget https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks
wget https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks.bash-completion
chmod +x winetricks
mv winetricks /usr/bin
mv winetricks.bash-completion /usr/share/bash-completion/completions/winetricks
```

4. Install **MDAC28** with **winetricks**

To pass this step, you should have GUI (on Linux) or [MobaxTerm](https://mobaxterm.mobatek.net/download.html) (on windows). Pretend that `10.10.11.22` your computer where the Mobaxterm located at.

``` bash
apt update && apt install -y xterm
DISPLAY=10.10.11.22:0.0 WINEARCH=win32 WINEPREFIX=~/.win32 winetricks mdac28
```
5. Upload `paysyswin` to `/jx/paysyswin`

6. Test its working by command

``` bash
cd /jx/paysyswin
WINEARCH=win32 WINEPREFIX=/root/.win32 GNUTLS_SYSTEM_PRIORITY_FILE=/jx/paysyswin/priorityGNU DISPLAY=:0.0 wine S3RelayServer.exe
WINEARCH=win32 WINEPREFIX=/root/.win32 GNUTLS_SYSTEM_PRIORITY_FILE=/jx/paysyswin/priorityGNU DISPLAY=:0.0 wine Sword3PaySys.exe
```

### Game server

1. Prepare the OS

``` bash
dpkg --add-architecture i386
apt update
apt install -y libuuid1:i386 libc6:i386 libstdc++6:i386
```

2. Run server

Your game will be easily managed by web-app. However, in case of manually running or testing, you have to modify the following files with your ip, and database.

> 1. gateway/goddess.cfg
> 2. gateway/bishop.cfg
> 3. gateway/s3relay/s3relay.cfg
> 4. server1/servercfg.cfg

Moreover, the following services should start in order and make sure it in working state.

> 1. gateway/goddess_y
> 2. gateway/bishop_y
> 3. gateway/s3relay/s3relay_y
> 4. server1/jx_linux_y

## Manually build

1. Start MobaXterm (Windows) and open a server to interact with installation
2. Login to Vultr Container Registry
docker build .\account-server\ -f .\account-server\Dockerfile.base  --build-arg DISPLAY=10.10.11.22:0.0 -t ewr.vultrcr.com/jxonline/account-server:linux-8.0 --push
docker build .\account-server\ -f .\account-server\Dockerfile.relay-server -t ewr.vultrcr.com/jxonline/relay-server:linux-8.0 --push
docker build .\account-server\ -f .\account-server\Dockerfile.pay-server -t ewr.vultrcr.com/jxonline/pay-server:linux-8.0 --push

## Prepare server

1. Run database
docker compose up

2. Restore database using Navicat or alternative ones

## Run server
docker compose up -d
docker run -d --network=host -e DISPLAY=10.10.11.22:0.0 ewr.vultrcr.com/jxonline/relay-server:linux-8.0
docker run -d --network=host -e DISPLAY=10.10.11.22:0.0 ewr.vultrcr.com/jxonline/pay-server:linux-8.0

# References
[How to Run a Linux Program at Startup with systemd](https://www.howtogeek.com/687970/how-to-run-a-linux-program-at-startup-with-systemd/)