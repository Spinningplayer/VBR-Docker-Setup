#/bin/bash

echo "Cloning API"
git clone https://github.com/spinningplayer/VeryBerryAPI.git
echo "Cloning Website"
git clone https://github.com/spinningplayer/VeryBerryRecordsWebsite.git
echo "Building Docker images"
docker build -t vbr-api VeryBerryAPI/
docker build -t vbr-web VeryBerryRecordsWebsite/VBR-App/
echo "starting containers"
docker-compose up -d
echo "Populating web_data"
CONTAINER_ID=$(docker ps -aqf "ancestor=vbr-web")
docker cp VeryBerryRecordsWebsite/VBR-App/src/assets/ ${CONTAINER_ID}:/usr/share/nginx/html/assets/
