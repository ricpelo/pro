.PHONY: all html pdf clean

SRCDIR=source
BUILDDIR=docs
PP=pp

SOURCES     := $(shell find $(SRCDIR) -type f -name *.md)
OBJECTSHTML := $(patsubst $(SRCDIR)/%,$(BUILDDIR)/%,$(SOURCES:.md=.html))
OBJECTSPDF  := $(patsubst $(SRCDIR)/%,$(BUILDDIR)/%,$(SOURCES:.md=.pdf))

all: $(OBJECTSHTML) # $(OBJECTSPDF)

html: $(OBJECTSHTML)

pdf: $(OBJECTSPDF)

$(BUILDDIR)/%.html: $(SRCDIR)/%.md $(PP)
	./pp $< | \
	pandoc -s -t revealjs --template=pandoc_revealjs.template \
		--highlight-style=solarized.theme \
		--syntax-definition=php.xml \
		--css custom.css \
		-V theme=solarized -V transition=zoom \
		-V width=1280 -V height=1080 -o $@
	rm -f docs/images/*.dat docs/images/*.gv

$(BUILDDIR)/%.pdf: $(BUILDDIR)/%.html
	php -S localhost:8081 &
	xdg-open http://localhost:8081/$^?print-pdf &

$(PP):
	wget -q -O - http://cdsoft.fr/pp/pp-linux-x86_64.txz | tar x -J pp

clean:
	rm -f $(OBJECTSHTML) $(OBJECTSPDF)
