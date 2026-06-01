QMD_PATH = "./posts/2026/2026-05-31-hackathon.qmd"
HTML_PATH = "_site/posts/2026/2026-05-31-hackathon.html"

render:
	quarto render .

update:
	quarto render .

post:
	quarto render $(QMD_PATH)

view: 
	open $(HTML_PATH)

publish:
	quarto publish gh-pages --no-prompt --no-browser
