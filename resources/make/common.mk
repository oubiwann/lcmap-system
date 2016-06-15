OS := $(shell uname -s)
ifeq ($(OS),Linux)
		HOST = $(HOSTNAME)
		GEM = sudo gem
endif
ifeq ($(OS),Darwin)
		HOST = $(shell scutil --get ComputerName)
		GEM = gem
endif

LIB = $(PROJECT)

update:
	$(GEM) update --system
	$(GEM) update

setup-docs:
	@echo "\nInstalling documentation up dependencies ..."
	$(GEM) install bundler --no-ri --no-rdoc
	bundle install --path vendor/bundle

setup-deps:
	@echo "\nInstalling LCMAP system dependencies ..."
	mkdir -p ~/.usgs
	cp config/lcmap.example.ini ~/.usgs/lcmap.ini
	cp config/lcmap.example.ini ~/.usgs/lcmap.test.ini
	./bin/setup-ubuntu-trusty

setup-repo:
	@echo "\nInstalling LCMAP projects ..."
	./bin/clone-projects

run-auth:
	@cd ../lcmap-rest/test/support/auth-server && lein trampoline run

run-rest:
	@cd ../lcmap-rest && lein trampoline run

run:
	@$(MAKE) run-auth &
	@$(MAKE) run-rest &
