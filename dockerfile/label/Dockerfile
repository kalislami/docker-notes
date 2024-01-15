FROM alpine:3

LABEL author="Kamal"
LABEL company="Kalislami" website="https://kalislami.gitlab.io/about-me"

RUN mkdir hello
RUN echo "Hello world" > "hello/world.txt"

CMD cat "hello/world.txt"

# run docker file:
# docker build -t kalislami/label dockerfile/label

# check detail label metadata
# docker image inspect kalislami/label