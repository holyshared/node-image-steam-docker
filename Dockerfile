FROM node:8.15-alpine
LABEL maintainer "Noritaka Horio <holy.shared.design@gmail.com>"
RUN apk add --update --no-cache gcc g++ make libc6-compat git cmake
RUN apk add vips-dev fftw-dev build-base --no-cache \
  --repository https://dl-3.alpinelinux.org/alpine/edge/testing/ \
  --repository https://dl-3.alpinelinux.org/alpine/edge/main

RUN npm install -g image-steam image-steam-s3

ADD index.js index.js

EXPOSE 13337

CMD node index.js
