PP=../pp
AUX=../aux
COMMON_PP=$(AUX)/common.pp

SRCDIR=.
BUILDDIR_PDF=.
SOURCES      := $(shell find $(SRCDIR) -type f -name *.md)
OBJECTS_PDF  := $(patsubst $(SRCDIR)/%,$(BUILDDIR_PDF)/%,$(SOURCES:.md=.pdf))

$(OBJECTS_PDF): $(SOURCES)
	$(PP) -DLATEX -import $(COMMON_PP) Funciones_recursivas.md | pandoc -s -o Funciones_recursivas.pdf
