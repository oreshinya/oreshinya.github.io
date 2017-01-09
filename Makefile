clean:
	rm -rf public/build

js:
	elm-make src/Main.elm --output=bundle.js

css:
	elm-css StyleCompiler.elm --module=StyleCompiler --output=./

build: clean js css