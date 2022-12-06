include .env
export

.PHONY: download-moodle
download-moodle:
	curl --location https://github.com/moodle/moodle/archive/$(MOODLE_VERSION).tar.gz | tar xz --strip-components=1 -C ./moodle/src

.PHONY: build
build:
	docker-compose up -d

.PHONY: install
install: download-moodle build
