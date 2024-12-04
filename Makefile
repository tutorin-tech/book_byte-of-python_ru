# https://github.com/honkit/honkit
setup:
	npm install honkit --save-dev

build:
	npx honkit build . public --log=debug

pdf:
	npx honkit pdf . byte-of-python-ru.pdf

epub:
	npx honkit epub . byte-of-python-ru.epub
	mv byte-of-python-ru.epub byte-of-python-ru.zip
	unzip byte-of-python-ru.zip -d byte-of-python-ru
	rm byte-of-python-ru.zip

	cd byte-of-python-ru/ && \
		sed -i 's/overflow: hidden;/ /g' stylesheet.css && \
		zip -r ../byte-of-python-ru.epub *

	rm -rf byte-of-python-ru

serve:
	npx honkit serve
