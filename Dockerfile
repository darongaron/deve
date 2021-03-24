#FROM node:14.15.1-alpine3.12
FROM ubuntu:20.04
#RUN apk add --update --no-cache \
#      curl  \
#      fzf \
#      git \
#      neovim \
#      tzdata && \
#    cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
#    echo "Asia/Tokyo" > /etc/timezone && \
#    apk del tzdata && \
#    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
#       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
#    # ln -s /usr/bin/python3 /usr/bin/python
#RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
  curl \
  git \
  locales \
  neovim \
  nodejs \
  ripgrep \
  tzdata && \
  locale-gen ja_JP.UTF-8 && \
  curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
  apt-get install -y nodejs && \
  apt-get clean && rm -rf /var/lib/apt/lists/* && \
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
ENV TZ Asia/Tokyo
ENV LANG ja_JP.UTF-8
#VOLUME /root

#### Set local to jp.
###RUN apt-get update && apt-get install -y language-pack-ja && \
###    update-locale LANG=ja_JP.UTF-8 && rm -rf /var/lib/apt/lists/*
###ENV LANG ja_JP.UTF-8
###ENV LANGUAGE ja_JP:ja
###ENV LC_ALL ja_JP.UTF-8

