FROM alpine:3

RUN mkdir hello
RUN echo "Hello world" > "hello/world.txt"
RUN cat "hello/world.txt"

# run docker file:
# docker build -t kalislami/run dockerfile/run

# run docker file + show datailnya:
# docker build -t kalislami/run dockerfile/run --progress=plain

# run docker file + no cache (opsi untuk running ulang dockerfile):
# docker build -t kalislami/run dockerfile/run --no-cache