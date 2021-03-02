#!/usr/bin/env perl

$latex = 'uplatex %O -kanji=utf8 -no-guess-input-enc -synctex=1 %S';
$pdflatex = 'pdflatex %O -synctex=1 %S';
$lualatex = 'lualatex %O -synctex=1 %S';
$xelatex = 'xelatex %O -synctex=1 %S';
#$biber = 'biber --bblencoding=utf8 -u -U --output_safechars';
$biber = 'biber %O --bblencoding=utf8 -u -U --output_safechars %B';
$bibtex = 'upbibtex %O %B';
$makeindex = 'upmendex %O -o %D %S';
#$dvipdf = 'dvipdfmx %O -o %D %S';
#$dvips = 'dvips %O -z -f %S | convbkmk -u > %D';
#$ps2pdf = 'ps2pdf.exe %O %S %D';
$pdf_mode = 4;
if ($^O eq 'MSWin32'){
  $pdf_previewer = '"C:\Program Files\RStudio\bin\sumatra\SumatraPDF.exe" -reuse-instance';
} elsif ($^O eq 'linux') {
  $pdf_previewer = "xdg-open %S";
} elsif ($^O eq 'darwin') {
  $pdf_previewer = "open %S";
} else {
  $pdf_previewer = "start %S";
}
$bibtex_use = 2;

# 削除する中間生成物ファイルの指定は，以下のサイトより
# https://tex.stackexchange.com/a/83386/169454
$clean_ext = 'synctex.gz synctex.gz(busy) run.xml tex.bak bbl bcf fdb_latexmk run tdo %R-blx.bib';