FROM php:8.1-cli-buster

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
  curl \
  fzf \
  git \
  locales \
  ripgrep \
  unzip && \
  locale-gen ja_JP.UTF-8
ENV TZ="Asia/Tokyo"
ENV LANG="ja_JP.UTF-8"

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# install nvim & vim-plug
ARG NVIM_FILE
ARG NVIM_DL_URL="https://github.com/neovim/neovim/releases/download/stable/${NVIM_FILE}.tar.gz"
ENV PATH="/usr/local/$NVIM_FILE/bin:$PATH"
RUN curl -fsSL $NVIM_DL_URL | tar -C /usr/local -xzf - && \
  sh -c 'curl -fsSLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim \
    --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# install node
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - && \
  apt-get install -y nodejs

# install deno & completion
ENV DENO_INSTALL="$HOME/.deno"
ENV PATH="$DENO_INSTALL/bin:$PATH"
RUN curl -fsSL https://deno.land/x/install/install.sh | sh && \
  deno completions bash > /etc/bash_completion.d/deno.bash && \
  echo ". /etc/bash_completion.d/deno.bash" >> /root/.bashrc

# install go
ENV PATH="$PATH:/usr/local/go/bin"
ARG GO_DL_URL="$GO_DL_URL"
RUN curl -fsSL $GO_DL_URL | tar -C /usr/local -xzf -

# install rust
ENV PATH="$PATH:$HOME/.cargo/bin"
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y -q && \
  echo ". $HOME/.cargo/env" >> /root/.bashrc

# clean
RUN  apt-get clean && rm -rf /var/lib/apt/lists/*
