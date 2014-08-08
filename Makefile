all : syllabus-psci-285.pdf

syllabus-psci-285.pdf : syllabus-psci-285.tex syllabus-body.tex
	latexmk -bibtex- syllabus-psci-285
	latexmk -c

syllabus-body.tex : syllabus.md
	pandoc syllabus.md -o syllabus-body-tmp.tex
	# sed -i'' 's/\[htbp\]/[2.75in]/' syllabus-body-tmp.tex
	# sed -i'' 's/{figure}/{marginfigure}/g' syllabus-body-tmp.tex
	# sed -i'' 's/includegraphics/includegraphics[width=80px]/' syllabus-body-tmp.tex
	# sed -i'' 's/\\caption/\\caption*/' syllabus-body-tmp.tex
	mv syllabus-body-tmp.tex syllabus-body.tex
