IMAGE?=docker.io/stellarproject/causeway:latest

all: build

build:
	@buildctl build --frontend=dockerfile.v0 --frontend-opt filename=Dockerfile.build --local context=. --local dockerfile=. --progress plain --exporter=local --exporter-opt output=./public
	@chmod 755 public

image:
	@buildctl build --frontend=dockerfile.v0 --local context=. --local dockerfile=. --exporter=image --exporter-opt name=${IMAGE}

clean:
	@rm -rf public

.PHONY: build image clean
