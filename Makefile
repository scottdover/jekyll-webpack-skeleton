NAME=jekyll-skeleton
VERSION=0.0.1

BIN := node_modules/.bin
CONCURRENTLY := $(BIN)/concurrently
ENVIRONMENT := development

.PHONY: jekyll webpack watch install

install: jekyll webpack

jekyll:
	gem install bundler && \
	bundle exec jekyll build

webpack:
	yarn install && \
	yarn build

watch:
ifeq ($(ENVIRONMENT), production)
	$(error "You can't watch the production environment, yo!")
endif
	echo $(ENVIRONMENT)
	$(CONCURRENTLY) 'yarn watch' 'bundle exec jekyll serve --port 4001 --incremental --watch'
