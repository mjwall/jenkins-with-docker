VERSION=1.0
IMAGE_NAME=mjwall/docker-jenkins

build: ## build an image
	docker build -t ${IMAGE_NAME}:${VERSION} .


run: ## run the image, mount and share docker sock
	docker run --group-add docker --rm -v /var/run/docker.sock:/var/run/docker.sock ${IMAGE_NAME}:${VERSION}

## still not working, jenkins inside the container does not have permission to the docker.sock even though the group is docker.  The id of the docker group in the container and on my host differ.
