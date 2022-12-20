FROM --platform=linux/amd64 node:18-bullseye-slim

RUN apt-get update && apt-get install -y curl \
    && apt-get clean autoclean \
    && apt-get autoremove --yes \
    && rm -rf /var/lib/{apt,dpkg,cache,log}/

# Cloudflare Wrangler CLI version
# https://github.com/cloudflare/wrangler2/releases
ARG WRANGLER_VERSION=2.6.2

RUN npm install --global wrangler@${WRANGLER_VERSION} esbuild@0.16.10

ENTRYPOINT ["/usr/local/bin/wrangler"]
