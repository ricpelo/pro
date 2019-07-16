.PHONY: all html pdf prog clean limpiar serve touch $(ITHACA)

CURSO=2019/2020

# Directorios

AUX=aux
SCRIPTS=scripts
SRCDIR=source
BUILDDIR=docs
BUILDDIR_HTML=$(BUILDDIR)/slides
BUILDDIR_PDF=$(BUILDDIR)/pdf
BUILDDIR_APUNTES=$(BUILDDIR)/apuntes
PROG_DIR=programacion
ITHACA=beamertheme-ithaca
ITHACA_SRC=$(AUX)/$(ITHACA)
ITHACA_DST=$(HOME)/texmf/tex/latex/beamer
IMAGES=images

# Archivos

PP=./pp
PANDOC=/usr/bin/pandoc
PROG=INF-1DAW-PRO-C19-20
PROG_LYX=$(PROG_DIR)/$(PROG).lyx
PROG_PDF=$(BUILDDIR)/assets/$(PROG).pdf
DIAPOS=$(BUILDDIR)/diapositivas.md
REVEAL=$(BUILDDIR_HTML)/reveal.js/js/reveal.js
REVEAL_TEMPLATE=$(AUX)/revealjs.template
LATEX_TEMPLATE=$(AUX)/beamer.template
PREAMBULO_BEAMER=$(AUX)/preambulo-beamer.tex
PREAMBULO_LATEX=$(AUX)/preambulo-latex.tex
HEADER_INCLUDES=$(AUX)/header-includes.html
INCLUDE_BEFORE=$(AUX)/include-before.html
HIGHLIGHT_STYLE=$(AUX)/solarized.theme
PHP_XML=$(AUX)/php.xml
CONSOLE_XML=$(AUX)/console.xml
COMMON_PP=$(AUX)/common.pp
DIAPOSITIVAS_SH=$(SCRIPTS)/diapositivas.sh

# Listas de archivos

SOURCES      := $(shell find $(SRCDIR) -type f -name *.md)
OBJECTS_HTML := $(patsubst $(SRCDIR)/%,$(BUILDDIR_HTML)/%,$(SOURCES:.md=.html))
OBJECTS_PDF  := $(patsubst $(SRCDIR)/%,$(BUILDDIR_PDF)/%,$(SOURCES:.md=.pdf))
APUNTES_PDF  := $(patsubst $(SRCDIR)/%,$(BUILDDIR_APUNTES)/%,$(SOURCES:.md=-apuntes.pdf))

# Objetivos generales

all: $(DIAPOS) html pdf apuntes prog limpiar

$(DIAPOS): $(SOURCES) $(DIAPOSITIVAS_SH)
	$(DIAPOSITIVAS_SH) > $(DIAPOS)

html: $(OBJECTS_HTML)

pdf: $(OBJECTS_PDF)

apuntes: $(APUNTES_PDF)

prog: $(PROG_PDF)

limpiar:
	@rm -f $(IMAGES)/*.dat $(IMAGES)/*.gv $(IMAGES)/*.uml

# Objetivos particulares

# Programación

$(PROG_PDF): $(PROG_LYX)
	@echo "Generando $(PROG_PDF)..."
	@lyx -E pdf2 $(PROG_DIR)/$(PROG).pdf $(PROG_LYX) >/dev/null || true
	@[ -f "$(PROG_DIR)/$(PROG).pdf" ] && mv -f $(PROG_DIR)/$(PROG).pdf $(PROG_PDF)

# Diapositivas en formato HTML

$(BUILDDIR_HTML)/%.html: $(SRCDIR)/%.md $(PP) $(PANDOC) $(REVEAL) $(REVEAL_TEMPLATE) $(HIGHLIGHT_STYLE) $(PHP_XML) $(CONSOLE_XML) $(HEADER_INCLUDES) $(INCLUDE_BEFORE)
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

# Diapositivas en formato PDF

$(BUILDDIR_PDF)/%.pdf: $(SRCDIR)/%.md $(PP) $(PANDOC) $(LATEX_TEMPLATE) $(HIGHLIGHT_STYLE) $(PREAMBULO_BEAMER) $(PHP_XML) $(CONSOLE_XML) | $(ITHACA)
	@echo "Generando $@..."
	@$(PP) -DBEAMER -DCURSO=$(CURSO) -import $(COMMON_PP) $< | \
		pandoc -s -t beamer \
		--template=$(LATEX_TEMPLATE) \
		--toc --toc-depth=1 -N \
		--slide-level=3 \
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

# Apuntes en formato PDF

$(BUILDDIR_APUNTES)/%-apuntes.pdf: $(SRCDIR)/%.md $(PP) $(PANDOC) $(LATEX_TEMPLATE) $(HIGHLIGHT_STYLE) $(PREAMBULO_LATEX) $(CONSOLE_XML) $(PHP_XML)
	@echo "Generando $@..."
	@$(PP) -DLATEX -DCURSO=$(CURSO) -import $(COMMON_PP) $< | \
		perl -0pe "s/\n\n---\n\n/\n\n/g" | \
		pandoc -s -t latex \
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

# Objetivos auxiliares

$(PP):
	wget -q -O - http://cdsoft.fr/pp/pp-linux-x86_64.txz | tar x -J pp
	sudo apt install default-jre graphviz librsvg2-bin npm
	npm install

$(PANDOC):
	$(SCRIPTS)/check-pandoc.sh

$(ITHACA):
	@[ ! -d "$(ITHACA_DST)" ] && mkdir -p "$(ITHACA_DST)" || true
	@rsync -qa --delete "$(ITHACA_SRC)" "$(ITHACA_DST)"

$(REVEAL):
	git submodule update --init --recursive

clean:
	rm -rf $(OBJECTS_HTML) $(OBJECTS_PDF) $(APUNTES_PDF) $(ITHACA_DST)/$(ITHACA) $(PROG_PDF)

serve:
	cd $(BUILDDIR) ; bundle install --path vendor/bundle && bundle exec jekyll serve --incremental

touch:
	touch $(OBJECTS_HTML) $(OBJECTS_PDF) $(APUNTES_PDF) $(PROG_PDF)
