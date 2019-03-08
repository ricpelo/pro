.PHONY: all html pdf clean setup

AUX=aux
SCRIPTS=scripts
SRCDIR=source
BUILDDIR=docs
BUILDDIRHTML=$(BUILDDIR)/slides
BUILDDIRPDF=$(BUILDDIR)/pdf
DIAPOS=$(BUILDDIR)/diapositivas.md
REVEAL=$(BUILDDIRHTML)/reveal.js/js/reveal.js
REVEAL_TEMPLATE=$(AUX)/pandoc_revealjs.template
LATEX_TEMPLATE=$(AUX)/plantilla.tex
PREAMBULO=$(AUX)/preambulo.tex
PHP_XML=$(AUX)/php.xml
PP=pp
ITHACA=beamertheme-ithaca
ITHACA_SRC=$(AUX)/$(ITHACA)
ITHACA_DST=$(HOME)/texmf/tex/latex/beamer/$(ITHACA)
PANDOC=/usr/bin/pandoc
HIGHLIGHT_STYLE=$(AUX)/solarized.theme

SOURCES     := $(shell find $(SRCDIR) -type f -name *.md)
OBJECTSHTML := $(patsubst $(SRCDIR)/%,$(BUILDDIRHTML)/%,$(SOURCES:.md=.html))
OBJECTSPDF  := $(patsubst $(SRCDIR)/%,$(BUILDDIRPDF)/%,$(SOURCES:.md=.pdf))

all: $(DIAPOS) html pdf

html: $(OBJECTSHTML)

pdf: $(OBJECTSPDF)

$(BUILDDIRHTML)/%.html: $(SRCDIR)/%.md $(PP) $(PANDOC) $(REVEAL) $(REVEAL_TEMPLATE) $(HIGHLIGHT_STYLE) $(PHP_XML)
	./pp $< | pandoc -s -t revealjs --template=$(REVEAL_TEMPLATE) \
		--toc --toc-depth=1 -N \
		--slide-level=2 \
		--highlight-style=$(HIGHLIGHT_STYLE) \
		--syntax-definition=$(PHP_XML) \
		--css custom.css -V slideNumber=true \
		-V theme=solarized -V transition=slide \
		-V width=1280 -V height=1080 -o $@
	@rm -f $(DOCS)/images/*.dat docs/images/*.gv

$(BUILDDIRPDF)/%.pdf: $(SRCDIR)/%.md $(PP) $(PANDOC) $(ITHACA_DST) $(LATEX_TEMPLATE) $(HIGHLIGHT_STYLE) $(PREAMBULO) $(PHP_XML)
	./pp $< | pandoc -s -t beamer --template=$(LATEX_TEMPLATE) \
		--toc \
		--slide-level=2 \
		-H $(PREAMBULO) \
		--pdf-engine=xelatex \
		--highlight-style=$(HIGHLIGHT_STYLE) \
		--syntax-definition=$(PHP_XML) \
		-V theme=Ithaca \
		-V fonttheme=structurebold \
		-V monofont=FiraCode \
		-V monofontoptions=Path=$(HOME)/.local/share/fonts/,Extension=.ttf,UprightFont=*-Regular,BoldFont=*-Bold,AutoFakeSlant,BoldItalicFeatures={FakeSlant},Scale=MatchLowercase,Contextuals={Alternate} \
		-V fontsize=8pt -V lang=es-ES -o $@
	@rm -f $(DOCS)/images/*.dat docs/images/*.gv

$(PP):
	wget -q -O - http://cdsoft.fr/pp/pp-linux-x86_64.txz | tar x -J pp
	sudo apt install plantuml graphviz

$(PANDOC):
	$(SCRIPTS)/check-pandoc.sh

$(ITHACA_DST):
	mkdir -p $$(dirname "$(ITHACA_DST)") && cp -rf "$(ITHACA_SRC)" "$(ITHACA_DST)"

$(DIAPOS): $(SOURCES)
	$(SCRIPTS)/diapositivas.sh > $(DIAPOS)

$(REVEAL):
	git submodule update --init --recursive

clean:
	rm -rf $(OBJECTSHTML) $(OBJECTSPDF) $(ITHACA_DST)

serve:
	cd $(DOCS) ; bundle exec jekyll serve --incremental
