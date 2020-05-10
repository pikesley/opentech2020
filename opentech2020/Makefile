install: install-reveal install-poetry

install-reveal:
	@-git clone https://github.com/hakimel/reveal.js.git
	cd reveal.js &&	npm install && npm audit fix

install-poetry:
	curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python

run:
	cd reveal.js && npm start
