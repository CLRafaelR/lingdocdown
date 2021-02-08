# lingdocdown
プログラミングによる，言語学向けの文書の生成を支援する説明書およびテンプレート

# 本ドキュメントが推奨するディレクトリ（フォルダ）構成

ここに示したディレクトリ構成の内，
`working_directory_with_Rproj`という親ディレクトリと，
その直下にある下位ディレクトリ`configuration`は，
`template4pdf.Rmd`などのテンプレートを直接編集して
文書生成を行う際に必要となる。
従って，これ以外の下位ディレクトリの設定は自由であり，下記に示しているのは
あくまで参考例である。
また，究極的には，文書生成に必要な設定を熟知している限り，
`working_directory_with_Rproj`や
`configuration`の設定の仕方，さらにはこれらフォルダの有無も
任意である。

`working_directory_with_Rproj`（必須）
: 基礎となる作業ディレクトリで，R project（拡張子.Rproj）と紐づいている。
  データや編集中のRmdファイル，出力されたPDF・docx・pptx，およびそれらファイルを格納する下位ディレクトリは，全て，この作業ディレクトリの下にある。
  いわば親ディレクトリである。
  この下位には，どのようなファイル・ディレクトリが，どのように入っていてもよい。
  但し，`template4pdf.Rmd`などのテンプレートを直接編集して
  文書生成を行うには，以下の`configuration`ディレクトリを含む必要がある。

`configuration`（必須）
: LaTeXの設定に必要なファイル，グロスを出力するのに必要なluaフィルタ[`pandoc-ling.lua`](https://github.com/CLRafaelR/lingdocdown)を格納している。
  `lingdocdown`に元から入っている設定ファイル以外のものを入れてもよい。

```
working_directory_with_Rproj/
　├ template4pdf.Rmd
　├ template4beamer.Rmd
　├ template4docx.Rmd
　├ template4pptx.Rmd
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
　├ configuration/
　│　├ pandoc-ling/
　│　│　├ pandoc-ling.lua
　│　│　└ ...
　│　├ latex
　│　│　├ fig-tab-box.tex
　│　│　├ linguistic-sets.tex
　│　│　└ ...
　│　└ ...
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

# LICENSE

<p xmlns:cc="http://creativecommons.org/ns#" xmlns:dct="http://purl.org/dc/terms/">
  <a property="dct:title" rel="cc:attributionURL" href="https://github.com/CLRafaelR/lingdocdown">
    lingdown
  </a>
  by 
  <a rel="cc:attributionURL dct:creator" property="cc:attributionName" href="https://github.com/CLRafaelR">
    小川雅貴 (Masataka OGAWA)
  </a> 
  is licensed under 
  <a href="http://creativecommons.org/licenses/by-nc-sa/4.0/?ref=chooser-v1" target="_blank" rel="license noopener noreferrer" style="display:inline-block;">
    Attribution-NonCommercial-ShareAlike 4.0 International
    <br/>
    <img style="height:22px!important;margin-left:3px;vertical-align:text-bottom;" src="https://mirrors.creativecommons.org/presskit/icons/cc.svg?ref=chooser-v1">
    <img style="height:22px!important;margin-left:3px;vertical-align:text-bottom;" src="https://mirrors.creativecommons.org/presskit/icons/by.svg?ref=chooser-v1">
    <img style="height:22px!important;margin-left:3px;vertical-align:text-bottom;" src="https://mirrors.creativecommons.org/presskit/icons/nc.svg?ref=chooser-v1">
    <img style="height:22px!important;margin-left:3px;vertical-align:text-bottom;" src="https://mirrors.creativecommons.org/presskit/icons/sa.svg?ref=chooser-v1">
  </a>
</p>
