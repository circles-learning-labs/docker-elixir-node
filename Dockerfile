# syntax = docker/dockerfile:1
FROM elixir:1.10.4-alpine

# Important!  Update this no-op ENV variable when this Dockerfile
# is updated with the current date. It will force refresh of all
# of the base images and things like `apt-get update` won't be using
# old cached versions when the Dockerfile is built.
ENV REFRESHED_AT=2021-07-29
ENV MIX_ENV=prod

RUN apk --no-cache upgrade
RUN apk --no-cache add \
  git \
  gcc \
  g++ \
  libc-dev \
  make \
  curl \
  python2 \
  openssh \
  bash \
  ca-certificates \
  ncurses \
  coreutils \
  libgcc \
  linux-headers \
  grep \
  util-linux \
  binutils \
  findutils

# Install node/npm
ENV NVM_DIR /root/.nvm
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
ENV NODE_VERSION 10.16.3
RUN . $NVM_DIR/nvm.sh && nvm install -s $NODE_VERSION
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

RUN mix local.hex --force
RUN mix local.rebar --force

