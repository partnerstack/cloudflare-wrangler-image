# Cloudflare Wrangler CLI container image

[Wrangler is a command line tool for building Cloudflare Workers](https://developers.cloudflare.com/workers/wrangler/get-started/) which currently Cloudflare [do not seem to provide an image for on Docker Hub](https://hub.docker.com/u/cloudflare).

This image simply bundles the LTS version of Node.js and the Wrangler CLI so that the container image can be used standalone, or to build a Cloudflare Workers application from within CI/CD.

## Usage

### Locally

If you want to use the Wrangler CLI without downloading the binary, you can run it in the container image.

```bash
docker run partnerstack/cloudflare-wrangler
```

### CircleCI

If you are deploying your Cloudflare Workers application from within CircleCI or another deployment tool, you can use the container image as a step executor.

```yaml
jobs:
  deploy:
    docker:
      - image: partnerstack/cloudflare-wrangler
    parameters:
      environment:
        type: string
        description: Which environment are we deploying to?
      steps:
        - checkout
        - run: wrangler publish --env << parameters.environment >>
```
