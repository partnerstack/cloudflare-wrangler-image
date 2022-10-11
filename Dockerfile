FROM --platform=linux/amd64 node:lts-bullseye-slim

RUN apt-get update && apt-get install -y curl \
    && apt-get clean autoclean \
    && apt-get autoremove --yes \
    && rm -rf /var/lib/{apt,dpkg,cache,log}/

# Cloudflare Wrangler CLI version
# https://github.com/cloudflare/wrangler2/releases
ARG WRANGLER_VERSION=2.1.10

RUN npm install --global wrangler@${WRANGLER_VERSION}

ENTRYPOINT ["/usr/local/bin/wrangler"]
