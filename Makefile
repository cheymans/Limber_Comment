# Sample Makefile for tex files.
# Replace 'file' with the base name of the tex file.
# commands:
#    'file'	 creates dvi/ps or pdf file, according to 'mode'
#    bib	 like all, but with updates bibtex info
#    clean	 removes unneede files
#    backup	 creates a backup of the dir + subdirs

# LaTeX file name
source = limber2

DD     = $(source)-`date +"%Y%m%d"`.tgz


LATEX  = $(source)
LATEX3 = $(LATEX)

all: bib


$(source):
	pdflatex $(source)

bib:
	make $(LATEX)
	make bibtex
	#make bibsub
	make $(LATEX3)
	make $(LATEX3)

bibtex:
	bibtex $(source)


PHONY: clean backup mn_submission

clean:
	rm -f *~ $(source).b?? *.bbl *.blg *.aux *.log $(source).dvi $(source).ps $(source).pdf $(source).toc

backup:
	tar czf $(DD) * --exclude=*.tgz
#	h: dereference links
	cp $(DD) $(HOME)/sicher
	echo "Backup email of project $(source), on date `date`, file is $(DD)." | mutt -s "backup $(source)" -a $(DD) $(MAILID)

mn_submission:
	tar cvvzf limber2.tgz limber2.tex abbr-journals.tex authors.tex cfhtlens.tex conclusions.tex discussion.tex figures/IntegAll.pdf figures/P_kappa_limber_comp.pdf figures/P_kappa_limber_delta.pdf figures/P_kappa_limber_delta_Rijt.pdf figures/xi_m_comp.pdf figures/xi_m_delta.pdf figures/xi_p_comp.pdf figures/xi_p_delta.pdf figures/xi_p_wigner_delta.pdf figures/xi_m_wigner_delta.pdf

