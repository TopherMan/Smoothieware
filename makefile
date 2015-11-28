#!/usr/bin/make

DIRS = mbed src
DIRSCLEAN = $(addsuffix .clean,$(DIRS))

all:
	@ $(MAKE) -j -C mbed
	@echo Building Smoothie
	@ $(MAKE) -j -C src

clean: $(DIRSCLEAN)

$(DIRSCLEAN): %.clean:
	@echo Cleaning $*
	@ $(MAKE) -C $*  clean

debug-store:
	@ $(MAKE) -C src debug-store

flash:
	@ $(MAKE) -C src flash

dfu:
	@ $(MAKE) -C src dfu

upload:
	@ $(MAKE) -C src upload

debug:
	@ $(MAKE) -C src debug

console:
	@ $(MAKE) -C src console

deploy:
	@ $(MAKE) -C src deploy
server:
	@ $(MAKE) -C src server
config:
	@ $(MAKE) -C src config

.PHONY: all $(DIRS) $(DIRSCLEAN) debug-store flash upload debug console dfu deploy server config
