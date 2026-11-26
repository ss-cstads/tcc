# Compila os documentos usando a classe, o .bst e o .bib que ficam na raiz
# do projeto (por isso as variaveis *INPUTS abaixo).
#   make           -> TCC e memorial
#   make tcc       -> tcc/exemplo-tcc.pdf
#   make memorial  -> memorial/memorial-aproveitamento.pdf
#   make clean     -> remove os arquivos auxiliares (os PDFs sao mantidos)

export PATH := $(HOME)/bin:$(PATH)

LATEX = pdflatex --interaction=batchmode
BIBTEX = bibtex
RM = rm -f
ENV = TEXINPUTS=..: BIBINPUTS=..: BSTINPUTS=..:
AUX = aux log out ps toc dvi lof bbl lot loq blg

# $(1) = pasta, $(2) = arquivo .tex sem extensao
define compila
	cd $(1) && $(ENV) $(LATEX) $(2)
	cd $(1) && $(ENV) $(BIBTEX) $(2)
	cd $(1) && $(ENV) sh -c 'for f in bu[0-9]*.aux; do [ -f "$$f" ] && $(BIBTEX) "$${f%.aux}"; done; true'
	cd $(1) && $(ENV) $(LATEX) $(2)
	cd $(1) && $(ENV) $(LATEX) $(2)
	@echo ---------------------------------------------------
	@echo Ps: done. PDF em $(1)/$(2).pdf
endef

all: tcc memorial

tcc:
	$(call compila,tcc,exemplo-tcc)

memorial:
	$(call compila,memorial,memorial-aproveitamento)

clean:
	for d in tcc memorial; do \
	  (cd $$d && for e in $(AUX); do $(RM) *.$$e; done; \
	   $(RM) bu.aux bu[0-9]*.aux bu[0-9]*.bbl bu[0-9]*.blg *~ *backup); \
	done
	@echo ---------------------------------------------------
	@echo Directories cleaned

.PHONY: all tcc memorial clean
