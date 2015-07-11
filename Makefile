DIST=./build
WEBPACK=./node_modules/.bin/webpack
ENTRY=./src/index.ls
OUTPUT=$(DIST)/index.js

all: lson build

before:
	@ mkdir -p $(DIST)

lson: before
	@ lson -o build src/*.lson

bundle: before
	@ $(WEBPACK) $(ENTRY) $(OUTPUT)

build:
	@ make bundle
	@ make bundle ENTRY=./src/event.ls OUTPUT=$(DIST)/event.js
