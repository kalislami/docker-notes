docker pull mongo:latest

docker container create --name cMongo -p 270:27017 --env MONGO_INITDB_ROOT_USERNAME=kamal --env MONGO_INITDB_ROOT_PASSWORD=kamal mongo:latest

# create with mount
# bind
docker container create --name mongodata --mount "type=bind,source=C:\Users\Kamal\Desktop\projects\mine\docker-apps\mongo-data,destination=/data/db" -p 271:27017 --env MONGO_INITDB_ROOT_USERNAME=kamal --env MONGO_INITDB_ROOT_PASSWORD=kamal mongo:latest
# volume (jangan lupa create volume terlebih dahulu)
docker container create --name mongodata2 --mount "type=volume,source=mongovolume,destination=/data/db" -p 271:27017 --env MONGO_INITDB_ROOT_USERNAME=kamal --env MONGO_INITDB_ROOT_PASSWORD=kamal mongo:latest

# mongo backup volume steps
docker container stop mongodata2
mkdir backup
docker container create --name nginxbackup --mount "type=bind,source=C:\Users\Kamal\Desktop\projects\mine\docker-apps\backup,destination=/backup" --mount "type=volume,source=mongovolume,destination=/data" nginx:latest
docker container start nginxbackup
docker container exec -i -t nginxbackup /bin/bash
tar cvf /backup/backup.tar.gz /data
docker container stop nginxbackup
docker container rm nginxbackup #jika tidak dipakai lagi
docker container start mongodata2


# mongo backup volume steps 2
docker container stop mongodata2
docker container run --rm --name backup-with-ubuntu --mount "type=bind,source=C:\Users\Kamal\Desktop\projects\mine\docker-apps\backup,destination=/backup" --mount "type=volume,source=mongovolume,destination=/data" ubuntu:latest tar cvf /backup/backup2.tar.gz /data
docker container start mongodata2

# mongo restore volume steps
docker container stop mongodata2
docker volume create mongorestore
docker container run --rm --name restore-with-ubuntu --mount "type=bind,source=C:\Users\Kamal\Desktop\projects\mine\docker-apps\backup,destination=/backup" --mount "type=volume,source=mongorestore,destination=/data" ubuntu:latest bash -c "cd /data && tar xvf /backup/backup.tar.gz --strip 1"
docker container start mongodata2
# check volume dengan cara membuat container
docker container create --name mongodata-restore --mount "type=volume,source=mongorestore,destination=/data/db" -p 272:27017 --env MONGO_INITDB_ROOT_USERNAME=kamal --env MONGO_INITDB_ROOT_PASSWORD=kamal mongo:latest

# create mongo network container
docker network create mongonetwork
docker container create --network mongonetwork --name mongodb --env MONGO_INITDB_ROOT_USERNAME=kamal --env MONGO_INITDB_ROOT_PASSWORD=kamal mongo:latest
docker container create --network mongonetwork --name mongodbexpress -p 8081:8081 --env ME_CONFIG_MONGODB_URL="mongodb://kamal:kamal@mongodb:27017/" mongo-express:latest