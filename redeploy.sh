echo "Pulling API"
cd VeryBerryAPI/
git pull
echo "Pulling Website"
cd ../VeryBerryRecordsWebsite/
git pull
echo "Building Docker images"
docker build -t vbr-api VeryBerryAPI/
docker build -t vbr-web VeryBerryRecordsWebsite/VBR-App/
echo "restarting containers"
docker-compose down
docker-compose up -d
echo "Populating web_data"
CONTAINER_ID=$(docker ps -aqf "ancestor=vbr-web")
docker cp VeryBerryRecordsWebsite/VBR-App/src/assets/ ${CONTAINER_ID}:/usr/share/nginx/html/assets/
