#/bin/bash

echo "installing Docker"
curl -sSL https://get.docker.com/ | sh

echo "installing docker compose"
curl -SL https://github.com/docker/compose/releases/download/v2.24.6/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose

echo "Cloning API"
git clone https://github.com/spinningplayer/VeryBerryAPI.git
echo "Cloning Website"
git clone https://github.com/spinningplayer/VeryBerryRecordsWebsite.git
echo "Building Docker images"
docker build -t vbr-api VeryBerryAPI/
docker build -t vbr-web VeryBerryRecordsWebsite/
echo "starting containers"
docker-compose up -d
echo "Populating web_data"
docker cp VeryBerryRecordsWebsite/VBR-app/src/assets/* vbr-web:/usr/share/nginx/html/assets/
