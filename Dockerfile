FROM debian:9 AS builder

ARG HUGO_VERSION=0.54.0
ARG NODE_VERSION=10.15.0

RUN env

RUN apt-get update && apt-get install -y \
    build-essential \
    ca-certificates \
    curl \
    git \
    --no-install-recommends

RUN curl -L -o /tmp/node.tar.xz "https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}-linux-x64.tar.xz" \
    && mkdir -p /usr/local/lib/nodejs \
    && tar -xJf /tmp/node.tar.xz -C /usr/local/lib/nodejs \
    && ln -s /usr/local/lib/nodejs/node-v${NODE_VERSION}-linux-x64/bin/node /usr/bin/node \
    && ln -s /usr/local/lib/nodejs/node-v${NODE_VERSION}-linux-x64/bin/npm /usr/bin/npm \
    && ln -s /usr/local/lib/nodejs/node-v${NODE_VERSION}-linux-x64/bin/npx /usr/bin/npx

RUN curl -L -o /tmp/hugo.deb "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.deb" \
    && dpkg -i /tmp/hugo.deb

WORKDIR /workdir
COPY . /workdir/

RUN echo -n "Node.js version " && node --version \
  && echo -n "npm version " && npm --version \
  && hugo version

RUN npm ci \
    && npm run production \
    && hugo

FROM eclipsefdn/nginx

COPY --from=builder /workdir/public/ /usr/share/nginx/html/
