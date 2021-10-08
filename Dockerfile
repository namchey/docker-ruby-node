FROM ruby:2-alpine

ENV NODE_MAJOR 14

RUN apk add  --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/v3.10/main/ nodejs=14.17.6-r0

RUN apk add  --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/v3.10/main/ npm=10.24.1-r0

RUN apk add  --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/v3.10/main/ rsync=3.1.3-r1

RUN apk add  --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/v3.10/main/ python2=2.7.18-r2

RUN apk add --update yarn

RUN apk add --update openssh git unzip curl

RUN curl -O https://downloads.rclone.org/rclone-current-linux-amd64.zip \
  && unzip rclone-current-linux-amd64.zip \
  && cd rclone-*-linux-amd64 \
  && cp rclone /usr/bin/ \
  && chown root:root /usr/bin/rclone \
  && chmod 755 /usr/bin/rclone

ADD Gemfile ./Gemfile

RUN gem install bundler && bundle

RUN npm i -g nodemon eslint cross-env
