FROM alpine:3

RUN mkdir hello
ADD text/*.txt hello

CMD cat "hello/world.txt"

# ADD match pattern referensi dari: https://pkg.go.dev/path/filepath#Match

# run docker file:
# docker build -t kalislami/add dockerfile/add