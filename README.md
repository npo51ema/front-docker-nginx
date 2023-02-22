# Getting Started with Create React App and Docker

## Run from docker

### `docker build -t {image-name} .`

Build the docker image.

### `docker run -p 8080:80 --name {container-name} -d {image-name}`

Run the docker container on 8080 port.

### `docker stop {container-name} .`

Stop the docker container.

### `docker rm {container-name} .`

Remove the docker container.
