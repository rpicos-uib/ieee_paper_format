#!/usr/bin/bash

echo "This script adds header and footer to the pdf"
echo "By Rodrigo Picos"
echo "I don't take any responsability for any damage. The script is provided as it is."
echo "If you don't feel like using it, don't."
echo 

header1='2022 11th International Conference on Modern Circuits and Systems Technologies (MOCAST)'
footer1='978-1-6654-6717-9/22/\$31.00~~\copyright~~2022~~IEEE'
in_directory=papers

in_file='1'

mkdir "$in_directory"_ieee
cd $in_directory


for in_file in *.pdf
 do
	tex_file="\documentclass{article}
		\RequirePackage[a4paper,top=2cm,left=3cm,right=3cm,bottom=2cm]{geometry}

		\usepackage{pdfpages}
		\usepackage{fancyhdr}
		\begin{document}

		\fancyhf{}

		\fancyhead[CO]{$header1}
		\fancyfoot[CO]{$footer1}

	  \includepdf[scale=1.0,pagecommand={\thispagestyle{fancy}},pages=1 ]{$in_file}
	  \includepdf[scale=1.0,pagecommand={\thispagestyle{empty}},pages=2-]{$in_file}

	\end{document}"


	echo "Input files is:" "$tex_file"
	
	echo "Output file is: " "$in_file"_ieee.tex

	echo "$tex_file" > "$in_file"_ieee.tex
	echo 

	pdflatex "$in_file"_ieee.tex

	mv "$in_file"_ieee.pdf ../"$in_directory"_ieee
	rm "$in_file"_ieee.*

done

cd ..
