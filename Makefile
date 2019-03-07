.PHONY: all html pdf clean setup

AUX=aux
SCRIPTS=scripts
SRCDIR=source
BUILDDIR=docs
BUILDDIRHTML=$(BUILDDIR)/slides
BUILDDIRPDF=$(BUILDDIR)/pdf
TRANS=$(BUILDDIR)/transparencias.md
REVEAL=$(BUILDDIRHTML)/reveal.js/js/reveal.js
REVEAL_TEMPLATE=$(AUX)/pandoc_revealjs.template
LATEX_TEMPLATE=$(AUX)/plantilla.tex
PREAMBULO=$(AUX)/preambulo.tex
PHP_XML=$(AUX)/php.xml
PP=pp
ITHACA=$(HOME)/texmf/tex/latex/beamer/beamertheme-ithaca
PANDOC=/usr/bin/pandoc
HIGHLIGHT_STYLE=$(AUX)/solarized.theme

SOURCES     := $(shell find $(SRCDIR) -type f -name *.md)
OBJECTSHTML := $(patsubst $(SRCDIR)/%,$(BUILDDIRHTML)/%,$(SOURCES:.md=.html))
OBJECTSPDF  := $(patsubst $(SRCDIR)/%,$(BUILDDIRPDF)/%,$(SOURCES:.md=.pdf))

all: $(TRANS) html pdf

html: $(OBJECTSHTML)

pdf: $(OBJECTSPDF)

$(BUILDDIRHTML)/%.html: $(SRCDIR)/%.md $(PP) $(PANDOC) $(REVEAL) $(REVEAL_TEMPLATE) $(HIGHLIGHT_STYLE) $(PHP_XML)
	./pp $< | pandoc -s -t revealjs --template=$(REVEAL_TEMPLATE) \
		--toc --toc-depth=1 \
		--highlight-style=$(HIGHLIGHT_STYLE) \
		--syntax-definition=$(PHP_XML) \
		--css custom.css -V slideNumber=true \
		-V theme=solarized -V transition=slide \
		-V width=1280 -V height=1080 -o $@
	@rm -f $(DOCS)/images/*.dat docs/images/*.gv

$(BUILDDIRPDF)/%.pdf: $(SRCDIR)/%.md $(PP) $(PANDOC) $(ITHACA) $(LATEX_TEMPLATE) $(HIGHLIGHT_STYLE) $(PREAMBULO) $(PHP_XML)
	./pp $< | pandoc -s -t beamer --template=$(LATEX_TEMPLATE) \
		--toc \
		-H $(PREAMBULO) \
		--pdf-engine=xelatex \
		--highlight-style=$(HIGHLIGHT_STYLE) \
		--syntax-definition=$(PHP_XML) \
		-V theme=Ithaca \
		-V fonttheme=structurebold \
		-V fontsize=8pt -V lang=es-ES -o $@
	@rm -f $(DOCS)/images/*.dat docs/images/*.gv

$(PP):
	wget -q -O - http://cdsoft.fr/pp/pp-linux-x86_64.txz | tar x -J pp
	sudo apt install plantuml graphviz

$(PANDOC):
	$(SCRIPTS)/check-pandoc.sh

$(ITHACA):
	BASE=$$(readlink -f $$(dirname "$(ITHACA)")) && mkdir -p $$BASE && unzip -D $(AUX)/beamertheme-ithaca.zip -d $$BASE

$(TRANS): $(SOURCES)
	$(SCRIPTS)/transparencias.sh > $(TRANS)

$(REVEAL):
	git submodule update --init --recursive

clean:
	rm -f $(OBJECTSHTML) $(OBJECTSPDF)

serve:
	cd $(DOCS) ; bundle exec jekyll serve --incremental
