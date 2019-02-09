.PHONY: all html pdf clean setup

SRCDIR=source
BUILDDIR=docs
BUILDDIRHTML=$(BUILDDIR)/slides
BUILDDIRPDF=$(BUILDDIR)/pdf
PP=pp

SOURCES     := $(shell find $(SRCDIR) -type f -name *.md)
OBJECTSHTML := $(patsubst $(SRCDIR)/%,$(BUILDDIRHTML)/%,$(SOURCES:.md=.html))
OBJECTSPDF  := $(patsubst $(SRCDIR)/%,$(BUILDDIRPDF)/%,$(SOURCES:.md=.pdf))

all: $(OBJECTSHTML) # $(OBJECTSPDF)

html: $(OBJECTSHTML)

pdf: $(OBJECTSPDF)

$(BUILDDIRHTML)/%.html: $(SRCDIR)/%.md $(PP)
	./pp $< | \
	pandoc -s -t revealjs --template=pandoc_revealjs.template \
		--highlight-style=solarized.theme \
		--syntax-definition=php.xml \
		--css custom.css -V slideNumber=true \
		-V theme=solarized -V transition=slide \
		-V width=1280 -V height=1080 -o $@
	rm -f docs/images/*.dat docs/images/*.gv

$(BUILDDIRPDF)/%.pdf: $(BUILDDIRHTML)/%.html
	php -S localhost:8081 &
	xdg-open http://localhost:8081/$^?print-pdf &

$(PP):
	wget -q -O - http://cdsoft.fr/pp/pp-linux-x86_64.txz | tar x -J pp

clean:
	rm -f $(OBJECTSHTML) $(OBJECTSPDF)

serve:
	cd docs ; bundle exec jekyll serve --incremental

setup:
	./check-pandoc.sh
	sudo apt install plantuml graphviz
