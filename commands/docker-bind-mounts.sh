
docker container create --name mongodata --publish 27018:27017 --mount "type=bind,source=/Users/asus/OneDrive/Desktop/learn-docker/mongo-data,destination=/data/db" --env MONGO_INITDB_ROOT_USERNAME=eko --env MONGO_INITDB_ROOT_PASSWORD=eko mongo:latest

docker volume create mongodata
docker container create --name mongovolume --publish 27019:27017 --mount "type=volume,source=D:/mongodata,destination=/data/db" --env MONGO_INITDB_ROOT_USERNAME=rifki --env MONGO_INITDB_ROOT_PASSWORD=rifki mongo:latest
