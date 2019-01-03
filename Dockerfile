FROM alpine:3.8
LABEL maintainer "Noritaka Horio <holy.shared.design@gmail.com>"
RUN apk add nodejs npm vips-dev fftw-dev build-base --update-cache \
  --repository https://alpine.global.ssl.fastly.net/alpine/edge/testing/ \
  --repository https://alpine.global.ssl.fastly.net/alpine/edge/main

RUN addgroup -S node && adduser -S node -G node

ADD index.js index.js

USER node
RUN mkdir /home/node/.npm-global
ENV PATH=/home/node/.npm-global/bin:$PATH
ENV NPM_CONFIG_PREFIX=/home/node/.npm-global
RUN npm install -g image-steam image-steam-s3

EXPOSE 13337

ENTRYPOINT node index.js
