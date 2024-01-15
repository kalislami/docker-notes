FROM alpine:3

RUN mkdir hello
RUN echo "Hello world" > "hello/world.txt"
RUN cat "hello/world.txt"

# run docker file:
# cd dir_path dulu
# docker build -t kalislami/custom . -f dev.Dockerfile