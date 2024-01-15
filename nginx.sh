docker container create --name cNginx -p 8080:80 nginx:latest

# with resource limit
docker container create --name small-nginx -p 8081:80 --memory 100m --cpus 0.5 nginx:latest