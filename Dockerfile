FROM --platform=linux/amd64 node:lts-bullseye-slim

# Cloudflare Wrangler CLI version
# https://github.com/cloudflare/wrangler2/releases
ARG WRANGLER_VERSION=2.1.10

RUN npm install --global wrangler

ENTRYPOINT ["/usr/local/bin/wrangler"]
