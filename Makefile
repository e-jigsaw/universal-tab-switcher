DIST=./build
WEBPACK=./node_modules/.bin/webpack
JADE = ./node_modules/.bin/jade
ENTRY=./src/index.ls
OUTPUT=$(DIST)/index.js

all: lson build jade

before:
	@ mkdir -p $(DIST)

lson: before
	@ lson -o build src/*.lson

bundle: before
	@ $(WEBPACK) $(ENTRY) $(OUTPUT)

build: before
	@ make bundle
	@ make bundle ENTRY=./src/event.ls OUTPUT=./build/event.js

jade: before
	@ $(JADE) src --out $(DIST)

.PHONY: before lson bundle build jade
