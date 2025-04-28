NODE_VERSION=8.17.0
METEOR_VERSION=1.8.3

build:
	docker build --build-arg="NODE_VERSION=${NODE_VERSION}" --build-arg="METEOR_VERSION=${METEOR_VERSION}" -t conectra/meteor-base:${METEOR_VERSION} . --debug
	docker push conectra/meteor-base:${METEOR_VERSION}
