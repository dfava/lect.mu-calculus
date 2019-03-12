name = main

main: dot
	pdflatex $(name)
	bibtex -min-crossrefs=1 $(name)
	pdflatex $(name)
	bibtex -min-crossrefs=1 $(name)

dot: figures/lts.dot figures/lts_hml.dot
	dot figures/lts.dot -Tpdf -o figures/lts.pdf
	dot figures/lts_hml.dot -Tpdf -o figures/lts_hml.pdf
	dot figures/kleene_1_bot.dot -Tpdf -o figures/kleene_1_bot.pdf
	dot figures/iso_1.dot -Tpdf -o figures/iso_1.pdf
	dot figures/iso_2.dot -Tpdf -o figures/iso_2.pdf
	dot figures/trace_eq_1.dot -Tpdf -o figures/trace_eq_1.pdf
	dot figures/trace_eq_2.dot -Tpdf -o figures/trace_eq_2.pdf

dotclean:
	rm -rf figures/lts.pdf
	rm -rf figures/lts_hml.pdf
	rm -rf figures/iso_*.pdf
	rm -rf figures/trace_eq_*.pdf
	rm -rf figures/kleene_*_bot.pdf

clean: dotclean
	rm -f $(name).log $(name).aux $(name).toc $(name).dvi $(name).pdf $(name).bbl $(name).blg $(name).glo $(name).ist $(name).glg $(name).gls $(name).out $(name).idx $(name).nav $(name).snm $(name).bcf $(name).run.xml _autidx_.* extracted.bib
