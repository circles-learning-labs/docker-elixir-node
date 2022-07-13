# syntax = docker/dockerfile:1
FROM elixir:1.13.4-alpine

# Important!  Update this no-op ENV variable when this Dockerfile
# is updated with the current date. It will force refresh of all
# of the base images and things like `apt-get update` won't be using
# old cached versions when the Dockerfile is built.
ENV REFRESHED_AT=2022-06-22
ENV MIX_ENV=prod

RUN apk --no-cache upgrade
RUN apk --no-cache add \
  git \
  gcc \
  g++ \
  libc-dev \
  make \
  curl \
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
  findutils \
  npm       \
  nodejs \
  yarn

# Set node version
ENV NODE_VERSION 16.15.0

RUN mix local.hex --force
RUN mix local.rebar --force

