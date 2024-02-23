#/bin/bash

echo "installing Docker"
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh ./get-docker.sh --dry-run

echo "installing docker compose"
curl -SL https://github.com/docker/compose/releases/download/v2.24.6/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose

echo "Cloning API"
git clone https:/github.com/spinningplayer/VeryBerryAPI.git
echo "Cloning Website"
git clone https:/github.com/spinningplayer/VeryBerryWebsite.git
echo "Building Docker images"
docker build -t vbr-api VeryBerryAPI/
docker build -t vbr-web VeryBerryWebsite/
echo "starting containers"
docker-compose up
echo "Populating web_data"
docker cp VeryBerryWebsite/VBR-app/src/assets/* vbr-web:/usr/share/nginx/html/assets/
