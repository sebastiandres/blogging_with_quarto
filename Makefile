QMD_PATH = "./posts/2026/2026-05-31-hackathon.qmd"
HTML_PATH = "_site/posts/2026/2026-05-31-hackathon.html"

# Use the project venv's Python so posts with code cells can execute
# (system python3 lacks pyyaml/jupyter -> "No module named 'yaml'").
export QUARTO_PYTHON = $(CURDIR)/venv/bin/python

build:
	rm -rf _site/
	quarto render --profile esp
	quarto render --profile eng

render: build
	open _site/index.html

preview:
	quarto preview --profile esp

eng:
	quarto preview --profile eng

post:
	quarto render $(QMD_PATH)

view: 
	open $(HTML_PATH)

publish: build
	quarto publish gh-pages --no-render --no-prompt --no-browser

clean:
	rm -rf _site/
