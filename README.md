# lingdocdown
プログラミングによる，言語学向けの文書の生成を支援する説明書およびテンプレート

# 本ドキュメントが推奨するディレクトリ（フォルダ構成）

`working_directory_with_Rproj`
: 基礎となる作業ディレクトリで，R project（拡張子.Rproj）と紐づいている。
  データや編集中のRmdファイル，出力されたPDF・docx・pptx，およびそれらファイルを格納する下位ディレクトリは，全て，この作業ディレクトリの下にある。
  いわば親ディレクトリである。



```
working_directory_with_Rproj/
　├ parent.Rmd
　├ childs/
　│　├ child1.Rmd
　│　├ child2.Rmd
　│　├ ...
　│　└ childN.Rmd
　├ data/
　│　├ csv/
　│　├ mp4/
　│　├ ...
　│　└ ext/
　├ data/
　│　├ csv/
　│　├ mp4/
　│　├ ...
　│　└ ext/
　└ figures/
　　　├ pdf/
　　　│　├ figure1.pdf
　　　│　├ figure2.pdf
　　　│　├ ...
　　　│　└ figureN.pdf
　　　└ png/
　　　　　├ figure1.png
　　　　　├ figure2.png
　　　　　├ ...
　　　　　└ figureN.png
 ```
