FROM node:8.15-alpine
LABEL maintainer "Noritaka Horio <holy.shared.design@gmail.com>"
RUN apk add vips-dev fftw-dev build-base git cmake python --update-cache \
  --repository https://alpine.global.ssl.fastly.net/alpine/edge/testing/ \
  --repository https://alpine.global.ssl.fastly.net/alpine/edge/main

RUN npm install -g image-steam image-steam-s3

ADD index.js index.js

EXPOSE 13337

CMD node index.js
