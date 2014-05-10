PAPER = thesis
LATEX = latex
PDFLATEX = pdflatex
TEXFILES = *.tex content/*.tex
BIBFILE = content/references.bib

default: $(PAPER).pdf

$(PAPER).dvi: $(TEXFILES) $(BIBFILE) makefile
	$(LATEX) $(PAPER)
	bibtex $(PAPER)
	$(LATEX) $(PAPER)
	$(LATEX) $(PAPER)

$(PAPER).pdf: $(TEXFILES) $(BIBFILE) makefile
	$(PDFLATEX) $(PAPER)
	bibtex $(PAPER)
	$(PDFLATEX) $(PAPER)
	$(PDFLATEX) $(PAPER)

pdf: $(PAPER).pdf

clean:
	rm -f *.pdf *.ps *.dvi *.aux *.bbl *.blg *.log *.lot *.lof *.toc *.out *synctex.gz *~
