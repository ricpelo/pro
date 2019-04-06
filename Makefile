.PHONY: all html pdf prog clean limpiar serve $(ITHACA)

AUX=aux
SCRIPTS=scripts
SRCDIR=source
BUILDDIR=docs
IMAGES=images
BUILDDIRHTML=$(BUILDDIR)/slides
BUILDDIRPDF=$(BUILDDIR)/pdf
BUILDDIRAPUNTES=$(BUILDDIR)/apuntes
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
PP=./pp
COMMON_PP=$(AUX)/common.pp
DIAPOSITIVAS_SH=$(SCRIPTS)/diapositivas.sh
ITHACA=beamertheme-ithaca
ITHACA_SRC=$(AUX)/$(ITHACA)
ITHACA_DST=$(HOME)/texmf/tex/latex/beamer
PANDOC=/usr/bin/pandoc
HIGHLIGHT_STYLE=$(AUX)/solarized.theme
PROG_DIR=programacion
PROG=INF-2DAW-DWESE-C19-20
PROG_LYX=$(PROG_DIR)/$(PROG).lyx
PROG_PDF=$(BUILDDIR)/assets/$(PROG).pdf
CURSO=2019/2020

SOURCES     := $(shell find $(SRCDIR) -type f -name *.md)
OBJECTSHTML := $(patsubst $(SRCDIR)/%,$(BUILDDIRHTML)/%,$(SOURCES:.md=.html))
OBJECTSPDF  := $(patsubst $(SRCDIR)/%,$(BUILDDIRPDF)/%,$(SOURCES:.md=.pdf))
APUNTESPDF  := $(patsubst $(SRCDIR)/%,$(BUILDDIRAPUNTES)/%,$(SOURCES:.md=-apuntes.pdf))

all: $(DIAPOS) html pdf apuntes prog limpiar

html: $(OBJECTSHTML)

pdf: $(OBJECTSPDF)

apuntes: $(APUNTESPDF)

prog: $(PROG_PDF)

$(PROG_PDF): $(PROG_LYX)
	@echo "Generando $(PROG_PDF)..."
	@lyx -E pdf2 $(PROG_DIR)/$(PROG).pdf $(PROG_LYX) >/dev/null || true
	@[ -f "$(PROG_DIR)/$(PROG).pdf" ] && mv -f $(PROG_DIR)/$(PROG).pdf $(PROG_PDF)

$(BUILDDIRHTML)/%.html: $(SRCDIR)/%.md $(PP) $(PANDOC) $(REVEAL) $(REVEAL_TEMPLATE) $(HIGHLIGHT_STYLE) $(PHP_XML) $(CONSOLE_XML) $(HEADER_INCLUDES) $(INCLUDE_BEFORE)
	@echo "Generando $@..."
	@$(PP) -DHTML -DCURSO=$(CURSO) -import $(COMMON_PP) $< | pandoc -s -t revealjs \
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

$(BUILDDIRAPUNTES)/%-apuntes.pdf: $(SRCDIR)/%.md $(PP) $(PANDOC) $(LATEX_TEMPLATE) $(HIGHLIGHT_STYLE) $(PREAMBULO_LATEX) $(CONSOLE_XML) $(PHP_XML)
	@echo "Generando $@..."
	@$(PP) -DLATEX -DCURSO=$(CURSO) -import $(COMMON_PP) $< | pandoc -s -t latex \
	    --template=$(LATEX_TEMPLATE) \
		--toc --toc-depth=2 -N \
		-H $(PREAMBULO_LATEX) \
		--pdf-engine=xelatex \
		--highlight-style=$(HIGHLIGHT_STYLE) \
		--syntax-definition=$(PHP_XML) \
		--syntax-definition=$(CONSOLE_XML) \
		-V margin-bottom=4cm \
		-V subparagraph \
		-V mainfont=Lato \
		-V monofont=FiraMono \
		-V monofontoptions=Extension=.otf,UprightFont=*-Regular,BoldFont=*-Bold,AutoFakeSlant,BoldItalicFeatures={FakeSlant},Scale=MatchLowercase,Contextuals={Alternate} \
		-V fontsize=10pt -V lang=es-ES -o $@

$(BUILDDIRPDF)/%.pdf: $(SRCDIR)/%.md $(PP) $(PANDOC) $(LATEX_TEMPLATE) $(HIGHLIGHT_STYLE) $(PREAMBULO_BEAMER) $(PHP_XML) $(CONSOLE_XML) | $(ITHACA)
	@echo "Generando $@..."
	@$(PP) -DBEAMER -DCURSO=$(CURSO) -import $(COMMON_PP) $< | pandoc -s -t beamer \
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

$(DIAPOS): $(SOURCES) $(DIAPOSITIVAS_SH)
	$(DIAPOSITIVAS_SH) > $(DIAPOS)

$(REVEAL):
	git submodule update --init --recursive

clean:
	rm -rf $(OBJECTSHTML) $(OBJECTSPDF) $(APUNTESPDF) $(ITHACA_DST)/$(ITHACA) $(PROG_PDF)

limpiar:
	@rm -f $(IMAGES)/*.dat $(IMAGES)/*.gv $(IMAGES)/*.uml

serve:
	cd $(BUILDDIR) ; bundle install --path vendor/bundle && bundle exec jekyll serve --incremental
