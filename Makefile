QMD_PATH = "./posts/2024/2024-05-23-experiencia-pycon-us.qmd"
HTML_PATH = "_site/posts/2024/2024-05-23-experiencia-pycon-us.html"

publish:
	quarto publish gh-pages --no-prompt --no-browser

render:
	quarto render .

update:
	quarto render .

post:
	quarto render $(QMD_PATH)

view: 
	open $(HTML_PATH)