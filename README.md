# docker-node-openbr [![docker pulls](https://img.shields.io/docker/pulls/mgcrea/node-openbr.svg)](https://registry.hub.docker.com/u/mgcrea/node-openbr/) [![image size](https://img.shields.io/imagelayers/image-size/mgcrea/node-openbr/latest.svg)](https://imagelayers.io/?images=mgcrea%2Fnode-openbr:latest)

Docker image for NodeJS with [OpenBR](http://openbiometrics.org/)

## Quickstart

- In your shell:

```sh
docker pull mgcrea/node-openbr:1.1.0
docker run --name test_openbr -it mgcrea/node-openbr:1.1.0 /bin/bash
```

- In your `Dockerfile`:

```
FROM mgcrea/node-openbr:1.1.0
```

### Usage with `docker-compose`

```yaml
# https://docs.docker.com/compose/yml/

version: '2'
services:
  backend:
    image: mgcrea/node-openbr:1.1.0
    container_name: test_openbr
    command: "node lib"
    # command: "/usr/local/bin/npm install --verbose"
    working_dir: /srv/node
    environment:
      - LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/opencv/build/lib
      - NODE_ENV=production
    expose:
      - "3000"
    volumes:
      - .:/srv/node
      - /usr/lib/beignet:/usr/lib/beignet:ro
    devices:
      - "/dev/video0:/dev/video0"
      - "/dev/dri/card0:/dev/dri/card0"
```

```sh
docker-compose up -d
```


### Latest tagged releases

- `mgcrea/node-openbr:1`
- `mgcrea/node-openbr:1.1`
- `mgcrea/node-openbr:1.1.0`
