# Compila o TCC (tcc/exemplo-tcc.tex) usando a classe, o .bst e o .bib
# que ficam na raiz do projeto (por isso as variaveis *INPUTS abaixo).

export PATH := $(HOME)/bin:$(PATH)

LATEX = pdflatex --interaction=batchmode
BIBTEX = bibtex
RM = rm -f
DIR = tcc
FILE = exemplo-tcc
ENV = TEXINPUTS=..: BIBINPUTS=..: BSTINPUTS=..:

all:
	cd $(DIR) && $(ENV) $(LATEX) $(FILE)
	cd $(DIR) && $(ENV) $(BIBTEX) $(FILE)
	cd $(DIR) && $(ENV) sh -c 'for f in bu[0-9]*.aux; do [ -f "$$f" ] && $(BIBTEX) "$${f%.aux}"; done; true'
	cd $(DIR) && $(ENV) $(LATEX) $(FILE)
	cd $(DIR) && $(ENV) $(LATEX) $(FILE)
	@echo ---------------------------------------------------
	@echo Ps: done. PDF em $(DIR)/$(FILE).pdf

clean:
	cd $(DIR) && $(RM) $(FILE).aux $(FILE).log $(FILE).out $(FILE).ps $(FILE).pdf $(FILE).toc $(FILE).dvi $(FILE).lof $(FILE).bbl $(FILE).lot $(FILE).loq $(FILE).blg bu.aux bu[0-9]*.aux bu[0-9]*.bbl bu[0-9]*.blg *~ *backup
	@echo ---------------------------------------------------
	@echo Directory cleaned
