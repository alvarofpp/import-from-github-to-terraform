# Variables
DOCKER_IMAGE=alvarofpp/boilerplate
ROOT=$(shell pwd)
DIR=image/

## Lint
DOCKER_IMAGE_LINTER=alvarofpp/linter:latest
LINT_COMMIT_TARGET_BRANCH=origin/main

# Commands
.PHONY: install-hooks
install-hooks:
	git config core.hooksPath .githooks

.PHONY: build
build: install-hooks
	@docker build ${DIR} -t ${DOCKER_IMAGE}

.PHONY: build-no-cache
build-no-cache: install-hooks
	@docker build ${DIR} -t ${DOCKER_IMAGE} --no-cache

.PHONY: push
push:
	@docker push ${DOCKER_IMAGE}

.PHONY: lint
lint:
	@docker pull ${DOCKER_IMAGE_LINTER}
	@docker run --rm -v ${ROOT}:/app ${DOCKER_IMAGE_LINTER} " \
		lint-commit ${LINT_COMMIT_TARGET_BRANCH} \
		&& lint-markdown \
		&& lint-dockerfile \
		&& lint-yaml \
		&& lint-shell-script"
