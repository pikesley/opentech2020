PROJECT = opentech2020
ID = pikesley/${PROJECT}

all: build

build:
	docker build \
		--tag ${ID} .

run:
	docker run \
		--name opentech \
		--volume $(shell pwd)/${PROJECT}:/opt/${PROJECT} \
		--interactive \
		--publish 8000:8000 \
		--tty \
		--rm \
		${ID} \
		bash

connect:
	docker exec \
		--interactive \
		--tty \
		opentech \
		bash

# this is flat-out juju
# https://stackoverflow.com/a/7367903
guard-%:
	@ if [ -z "${${*}}" ]; then \
		echo "You must provide the $* variable"; \
		exit 1; \
	fi

initialise:
	$(eval PROJECT_NAME = $(shell basename $(shell pwd)))
	find . -type f -exec sed -i '' "s/OpenTech/${PROJECT_NAME}/" {} \;
	mv OpenTech ${PROJECT_NAME}
