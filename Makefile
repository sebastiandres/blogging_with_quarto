QMD_PATH = "./posts/2026/2026-05-31-hackathon.qmd"
HTML_PATH = "_site/posts/2026/2026-05-31-hackathon.html"

render:
	rm -rf _site/
	quarto render --profile esp
	quarto render --profile eng
	open _site/index.html

preview:
	quarto preview --profile esp

eng:
	quarto preview --profile eng

post:
	quarto render $(QMD_PATH)

view: 
	open $(HTML_PATH)

publish:
	quarto publish gh-pages --no-prompt --no-browser

clean:
	rm -rf _site/
