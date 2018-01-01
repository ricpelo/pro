.PHONY: all html pdf clean

SRCDIR=source
BUILDDIR=docs

SOURCES     := $(shell find $(SRCDIR) -type f -name *.md)
OBJECTSHTML := $(patsubst $(SRCDIR)/%,$(BUILDDIR)/%,$(SOURCES:.md=.html))
OBJECTSPDF  := $(patsubst $(SRCDIR)/%,$(BUILDDIR)/%,$(SOURCES:.md=.pdf))

all: $(OBJECTSHTML) $(OBJECTSPDF)

html: $(OBJECTSHTML)

pdf: $(OBJECTSPDF)

$(BUILDDIR)/%.html: $(SRCDIR)/%.md
	pandoc -s -t revealjs --template=pandoc_revealjs.template \
		--highlight-style=solarized.theme \
		-V theme=solarized -V transition=zoom \
		-V width=1280 -V height=1280 $^ -o $@

$(BUILDDIR)/%.pdf: $(BUILDDIR)/%.html
	`npm bin`/decktape -s 1280x720 automatic $^ $@

clean:
	rm -f $(OBJECTSHTML) $(OBJECTSPDF)
