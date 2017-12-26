.PHONY: all clean

SRCDIR=source
BUILDDIR=docs

SOURCES     := $(shell find $(SRCDIR) -type f -name *.md)
OBJECTSHTML := $(patsubst $(SRCDIR)/%,$(BUILDDIR)/%,$(SOURCES:.md=.html))
OBJECTSPDF  := $(patsubst $(SRCDIR)/%,$(BUILDDIR)/%,$(SOURCES:.md=.pdf))

all: $(OBJECTSHTML) $(OBJECTSPDF)

$(BUILDDIR)/%.html: $(SRCDIR)/%.md
	pandoc -s -t revealjs --template=pandoc_revealjs.template -V theme=solarized $^ -o $@

$(BUILDDIR)/%.pdf: $(BUILDDIR)/%.html
	`npm bin`/decktape -s 1280x1024 automatic $^ $@

clean:
	rm -f $(OBJECTSHTML) $(OBJECTSPDF)
