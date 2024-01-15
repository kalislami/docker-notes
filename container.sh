# show list container
docker container ls -a

# show list running container
docker container ls

# create container
docker container create --name container_name image:tag

# create container + port forwarding / publish port
# notes: port forwarding bisa dibuat lebih dari satu, tinggal tambahkan argumennya aja
docker container create --name container_name --publish porthost:portcontainer image:tag
# atau
docker container create --name container_name --p porthost:portcontainer image:tag

# create container + env variable
docker container create --name container_name --env KEY="value" --env KEY2="value" image:tag

# create container + recource limit
docker container create --name container_name --memory set_memory --cpus set_cpu image:tag

# create container + mounting (readonly optional: jika tidak ingin di ubah isinya)
docker container create --name container_name --mount "type=bind,source=path_dir,destination=path_dir,readonly" image:tag

# create container + network
docker container create --name container_name --network network_name image:tag

# run container
docker container start id_or_name

# stop container
docker container stop id_or_name

# remove container
docker container rm id_or_name

# check log
docker container logs id_or_name

# check log realtime
docker container -f logs id_or_name

# exec container (keluar dari container: exit)
`docker container exec -i -t id_or_name /bin/bash`