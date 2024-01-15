# show list
docker network ls

# create
docker network create --driver driver_name network_name

# remove
docker network rm network_name

# disconnect
docker network disconnect network_name container_name

# connect
docker network connect network_name container_name