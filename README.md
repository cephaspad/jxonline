# JX Online server
## Manually build

1. Start MobaXterm (Windows) and open a server to interact with installation
2. Login to Vultr Container Registry
docker build .\account-server\ -f .\account-server\Dockerfile.base  --build-arg DISPLAY=10.10.11.22:0.0 -t ewr.vultrcr.com/jxonline/account-server:linux-8.0 --push
docker build .\account-server\ -f .\account-server\Dockerfile.relay-server -t ewr.vultrcr.com/jxonline/relay-server:linux-8.0 --push
docker build .\account-server\ -f .\account-server\Dockerifle.pay-server -t ewr.vultrcr.com/jxonline/pay-server:linux-8.0 --push

## Prepare server

1. Run database
docker compose up

2. Restore database using Navicat or alternative ones

## Run server
docker compose up -d
docker run -d -e DISPLAY=10.10.11.22:0.0 ewr.vultrcr.com/jxonline/relay-server
docker run -d -e DISPLAY=10.10.11.22:0.0 ewr.vultrcr.com/jxonline/pay-server