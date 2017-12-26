.PHONY: all

all: ud10 ud11

ud10: interoperabilidad.html interoperabilidad.pdf

ud11: introduccion-a-yii2.html introduccion-a-yii2.pdf

%.html: %.md
	pandoc -s -t revealjs $^ -o $@

%.pdf: %.md
	`npm bin`/decktape -s 1280x1024 automatic $^ $@
