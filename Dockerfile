FROM --platform=linux/amd64 debian:buster-slim

# Cloudflare Wrangler CLI version
# https://github.com/cloudflare/wrangler/releases
ARG WRANGLER_VERSION=1.19.12

# Install LTS version of Node.js for building Cloudflare Workers
# https://github.com/nodesource/distributions#debinstall
RUN apt-get update && apt-get install wget curl git -y
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash -
RUN apt-get update && apt-get install nodejs -y

# Download Cloudflare Wrangler CLI
RUN wget -q -c https://github.com/cloudflare/wrangler/releases/download/v${WRANGLER_VERSION}/wrangler-v${WRANGLER_VERSION}-x86_64-unknown-linux-musl.tar.gz -O - | tar -xz
RUN mv dist/wrangler /usr/local/bin/wrangler && chmod +x /usr/local/bin/wrangler

ENTRYPOINT ["/usr/local/bin/wrangler"]
