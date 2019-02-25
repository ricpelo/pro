.PHONY: all html pdf clean setup

SRCDIR=source
BUILDDIR=docs
BUILDDIRHTML=$(BUILDDIR)/slides
BUILDDIRPDF=$(BUILDDIR)/pdf
TRANS=$(BUILDDIR)/transparencias.md
REVEAL=$(BUILDDIRHTML)/reveal.js
PP=pp

SOURCES     := $(shell find $(SRCDIR) -type f -name *.md)
OBJECTSHTML := $(patsubst $(SRCDIR)/%,$(BUILDDIRHTML)/%,$(SOURCES:.md=.html))
OBJECTSPDF  := $(patsubst $(SRCDIR)/%,$(BUILDDIRPDF)/%,$(SOURCES:.md=.pdf))

all: $(TRANS) html pdf

html: $(OBJECTSHTML) $(REVEAL)

pdf: $(OBJECTSPDF)

$(BUILDDIRHTML)/%.html: $(SRCDIR)/%.md $(PP)
	./pp $< | pandoc -s -t revealjs --template=pandoc_revealjs.template \
		--toc --toc-depth=1 \
		--highlight-style=solarized.theme \
		--syntax-definition=php.xml \
		--css custom.css -V slideNumber=true \
		-V theme=solarized -V transition=slide \
		-V width=1280 -V height=1080 -o $@
	rm -f docs/images/*.dat docs/images/*.gv

$(BUILDDIRPDF)/%.pdf: $(SRCDIR)/%.md $(PP)
	./pp $< | pandoc -s -t beamer --template=plantilla.tex \
		--toc \
		-H preambulo.tex \
		--pdf-engine=xelatex \
		--highlight-style=solarized.theme \
		--syntax-definition=php.xml \
		-V theme=AnnArbor -V colortheme=seahorse \
		-V fonttheme=structurebold \
		-V fontsize=8pt -V lang=es-ES -o $@
	rm -f docs/images/*.dat docs/images/*.gv

$(PP):
	wget -q -O - http://cdsoft.fr/pp/pp-linux-x86_64.txz | tar x -J pp

$(TRANS): $(SOURCES)
	./transparencias.sh > $(TRANS)

$(REVEAL):
	git submodule update --init --recursive

clean:
	rm -f $(OBJECTSHTML) $(OBJECTSPDF)

serve:
	cd docs ; bundle exec jekyll serve --incremental

setup:
	./check-pandoc.sh
	sudo apt install plantuml graphviz
