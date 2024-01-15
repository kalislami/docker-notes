FROM alpine:3

RUN mkdir hello
RUN echo "Hello world" > "hello/world.txt"

CMD cat "hello/world.txt"

# notes: instruction CMD akan dijalankan setelah container running
# run docker file:
# docker build -t kalislami/cmd dockerfile/cmd

# check cmd command
# docker image inspect kalislami/cmd

# testing reproduce:
# docker container create --name cmd kalislami/cmd
# docker container start cmd
# docker container logs cmd