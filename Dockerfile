FROM alpine:3.10
LABEL maintainer "Noritaka Horio <holy.shared.design@gmail.com>"
RUN apk add nodejs npm python fftw-dev build-base --update-cache \
  --repository https://alpine.global.ssl.fastly.net/alpine/edge/testing/ \
  --repository https://alpine.global.ssl.fastly.net/alpine/edge/main

RUN addgroup -S node && adduser -S node -G node

USER node
WORKDIR /home/node
ADD index.js /home/node/index.js
ADD package.json /home/node/package.json
RUN npm install

EXPOSE 13337

ENTRYPOINT npm start
