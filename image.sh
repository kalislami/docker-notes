# show list images:
docker images
docker image ls

# show list images with filter:
docker images | grep filter_value

# delete image
docker rmi image_id
docker rm id_or_name id_or_name

# delete all images
docker rmi $(docker images -a -q)

# create image (image list: https://hub.docker.com/)
docker image pull name:tag

# check statistic container
docker container stats