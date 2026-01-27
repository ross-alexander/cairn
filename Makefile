all: johannas.pdf cairn.pdf

cairn.pdf: cairn.tex notes.tex
	lualatex cairn.tex

notes.tex: notes.md
	pandoc -f markdown -t latex -o $@ $<

johannas.pdf: johannas.tex
	texfot lualatex $<

johannas.tex: johannas.yaml cairn_sheet.py cairn_temp.j2
	./cairn_sheet.py -i $< -o $@ -t cairn_temp.j2

