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
	$(GEM) install bundler
	make docs-setup
