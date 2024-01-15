# menghapus container yang tidak berjalan
docker container prune

# menghapus image yang tidak digunakan samsek oleh containers
docker image prune

# menghapus network yang tidak digunakan samsek oleh containers
docker network prune

# menghapus volume yang tidak digunakan samsek oleh containers
docker volume prune

# menghapus container, network, dan image yang tidak aktif
docker system prune