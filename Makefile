DIST=./build
WEBPACK=./node_modules/.bin/webpack

all: lson build

before:
	@ mkdir -p $(DIST)

lson: before
	@ lson -o build src/*.lson

build: before
	@ $(WEBPACK) src/index.ls $(DIST)/index.js
