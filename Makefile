.PHONY: all html pdf clean limpiar setup $(ITHACA)

AUX=aux
SCRIPTS=scripts
SRCDIR=source
BUILDDIR=docs
BUILDDIRHTML=$(BUILDDIR)/slides
IMAGES=images
BUILDDIRPDF=$(BUILDDIR)/pdf
DIAPOS=$(BUILDDIR)/diapositivas.md
REVEAL=$(BUILDDIRHTML)/reveal.js/js/reveal.js
REVEAL_TEMPLATE=$(AUX)/revealjs.template
LATEX_TEMPLATE=$(AUX)/beamer.template
PREAMBULO_BEAMER=$(AUX)/preambulo-beamer.tex
PREAMBULO_LATEX=$(AUX)/preambulo-latex.tex
HEADER_INCLUDES=$(AUX)/header-includes.html
INCLUDE_BEFORE=$(AUX)/include-before.html
PHP_XML=$(AUX)/php.xml
CONSOLE_XML=$(AUX)/console.xml
PP=pp
COMMON_PP=$(AUX)/common.pp
ITHACA=beamertheme-ithaca
ITHACA_SRC=$(AUX)/$(ITHACA)
ITHACA_DST=$(HOME)/texmf/tex/latex/beamer
PANDOC=/usr/bin/pandoc
HIGHLIGHT_STYLE=$(AUX)/solarized.theme

SOURCES     := $(shell find $(SRCDIR) -type f -name *.md)
OBJECTSHTML := $(patsubst $(SRCDIR)/%,$(BUILDDIRHTML)/%,$(SOURCES:.md=.html))
OBJECTSPDF  := $(patsubst $(SRCDIR)/%,$(BUILDDIRPDF)/%,$(SOURCES:.md=.pdf))
APUNTESPDF  := $(patsubst $(SRCDIR)/%,$(BUILDDIRPDF)/%,$(SOURCES:.md=-apuntes.pdf))

all: $(DIAPOS) html pdf apuntes limpiar

html: $(OBJECTSHTML)

pdf: $(OBJECTSPDF)

apuntes: $(APUNTESPDF)

$(BUILDDIRHTML)/%.html: $(SRCDIR)/%.md $(PP) $(PANDOC) $(REVEAL) $(REVEAL_TEMPLATE) $(HIGHLIGHT_STYLE) $(PHP_XML) $(CONSOLE_XML) $(HEADER_INCLUDES) $(INCLUDE_BEFORE)
	@echo "Generando $@..."
	@./pp -import $(COMMON_PP) $< | pandoc -s -t revealjs \
	    --template=$(REVEAL_TEMPLATE) \
		-H $(HEADER_INCLUDES) \
		-B $(INCLUDE_BEFORE) \
		--toc --toc-depth=1 -N \
		--slide-level=4 \
		--highlight-style=$(HIGHLIGHT_STYLE) \
		--syntax-definition=$(PHP_XML) \
		--syntax-definition=$(CONSOLE_XML) \
		--css custom.css -V slideNumber=true \
		-V theme=solarized -V transition=slide \
		-V width=1280 -V height=1080 -o $@

$(BUILDDIRPDF)/%-apuntes.pdf: $(SRCDIR)/%.md $(PP) $(PANDOC) $(LATEX_TEMPLATE) $(HIGHLIGHT_STYLE) $(PREAMBULO_LATEX) $(CONSOLE_XML) $(PHP_XML)
	@echo "Generando $@..."
	@./pp -import $(COMMON_PP) $< | pandoc -s -t latex \
	    --template=$(LATEX_TEMPLATE) \
		--toc --toc-depth=2 -N \
		-H $(PREAMBULO_LATEX) \
		--pdf-engine=xelatex \
		--highlight-style=$(HIGHLIGHT_STYLE) \
		--syntax-definition=$(PHP_XML) \
		--syntax-definition=$(CONSOLE_XML) \
		-V documentclass=scrartcl \
		-V subparagraph \
		-V mainfont=Lato \
		-V monofont=FiraMono \
		-V monofontoptions=Extension=.otf,UprightFont=*-Regular,BoldFont=*-Bold,AutoFakeSlant,BoldItalicFeatures={FakeSlant},Scale=MatchLowercase,Contextuals={Alternate} \
		-V lang=es-ES -o $@

$(BUILDDIRPDF)/%.pdf: $(SRCDIR)/%.md $(PP) $(PANDOC) $(LATEX_TEMPLATE) $(HIGHLIGHT_STYLE) $(PREAMBULO_BEAMER) $(PHP_XML) $(CONSOLE_XML) | $(ITHACA)
	@echo "Generando $@..."
	@./pp -import $(COMMON_PP) $< | pandoc -s -t beamer \
	    --template=$(LATEX_TEMPLATE) \
		--toc --toc-depth=1 -N \
		--slide-level=4 \
		-H $(PREAMBULO_BEAMER) \
		--pdf-engine=xelatex \
		--highlight-style=$(HIGHLIGHT_STYLE) \
		--syntax-definition=$(PHP_XML) \
		--syntax-definition=$(CONSOLE_XML) \
		-V theme=Ithaca \
		-V mainfont=Lato \
		-V monofont=FiraMono \
		-V monofontoptions=Extension=.otf,UprightFont=*-Regular,BoldFont=*-Bold,AutoFakeSlant,BoldItalicFeatures={FakeSlant},Scale=MatchLowercase,Contextuals={Alternate} \
		-V fontsize=8pt -V lang=es-ES -o $@

$(PP):
	wget -q -O - http://cdsoft.fr/pp/pp-linux-x86_64.txz | tar x -J pp
	sudo apt install plantuml graphviz

$(PANDOC):
	$(SCRIPTS)/check-pandoc.sh

$(ITHACA):
	@rsync -qa --delete "$(ITHACA_SRC)" "$(ITHACA_DST)"

$(DIAPOS): $(SOURCES)
	$(SCRIPTS)/diapositivas.sh > $(DIAPOS)

$(REVEAL):
	git submodule update --init --recursive

clean:
	rm -rf $(OBJECTSHTML) $(OBJECTSPDF) $(APUNTESPDF) $(ITHACA_DST)/$(ITHACA)

limpiar:
	@rm -f $(IMAGES)/*.dat $(IMAGES)/*.gv $(IMAGES)/*.uml

serve:
	cd $(BUILDDIR) ; bundle install --path vendor/bundle && bundle exec jekyll serve --incremental
