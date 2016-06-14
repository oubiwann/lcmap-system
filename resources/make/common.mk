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

setup:
	$(GEM) install bundler --no-ri --no-rdoc
	make docs-setup

install:
	mkdir -p ~/.usgs
	cp config/lcmap.example.ini ~/.usgs/lcmap.ini
	cp config/lcmap.example.ini ~/.usgs/lcmap.test.ini
	./bin/setup-ubuntu-trusty

clone:
	./bin/clone-projects
