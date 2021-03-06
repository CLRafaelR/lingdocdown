---
title: "lingdocdown"
subtitile: |
  | プログラミングによる言語学向けの文書の生成を支援する情報集約型説明書
  | および（日本の）言語学関連学会の学会誌・予稿を作成するためのテンプレート
author: "小川雅貴（Ogawa, Masataka）"
---

# lingdocdown

プログラミングによる言語学向けの文書の生成を支援する情報集約型説明書
および（日本の）言語学関連学会の学会誌・予稿を作成するためのテンプレート

# 概要および開発趣旨

本レポジトリでは，**統計プログラミング言語Rから言語学の論文・レポートを生成する方法**を，Rのインストールの段階も含めて紹介する。

これまで言語学の論文・レポートは，Microsoft Word や LaTeX から作成されてきた。
しかし，Microsoft Word では，参考文献および図表・例文番号の自動付与と整形に加え，
グロス付与・句構造木の描画のような言語学特有の記述にも難しい面があった。
また，LaTeX は，こうした処理を得意としており，高度な組版も出来るが，
コマンドと本文（地の文）が混然一体となり見難く，かつプログラミングの慣熟までに高い敷居があった。

そこで本レポジトリでは，より平易な文書生成プログラミングであるRMarkdownを紹介する。
これにより，参考文献および図表・例文番号の処理と言語学特有の記述の体系的自動化が可能になり，
かつコマンドと地の文をより容易に識別しながら執筆できる。
しかも，統計プログラミング言語ならではの数値処理（RやPython等の実行）も利用できるため，
数値処理の結果も本文に直に・即時更新で取り込める。
本レポジトリは，
言語学分野への応用を念頭に，
プログラミングを使った文書作成技術を集約している。

現在の資料は，現在は RMarkdown から PDF を出力することに特化している。
PDF生成時に背後でLaTeX が動作するが，ユーザがLaTeX コマンドを使って組版する場面はほぼない。
但しLaTeX コマンドを好きなだけ組み入れることも自由である。
なお，LaTeX コマンドで組版する場面が減ったのであり，句構造木の描画には
TikZといったLaTeX パッケージのコマンドを使う（句構造木描画は，試行版ではカバーしていないため，将来的に実例を用意する）。

近い将来，
RMarkdown からdocx/pptx ファイルを出力したり，
beamer（スライド・ポスターを出力する LaTeX パッケージ）・revealjs（HTMLベースのスライド）を出力する方法を別途まとめたい。

また，日本言語学会の機関誌[『言語研究』の執筆要項](http://www.ls-japan.org/modules/documents/LSJpapers/j-gkstyle2020.pdf)に従い，
参考文献を生成するプログラムも合わせて開発途上にある。

# バージョン

試行版 `Ain't no mountain high enough`

## いま出来ること

1. [pandoc-ling](https://github.com/cysouw/pandoc-ling)を使用した，markdown形式でグロスを作成すること
    - たぶん本邦初の徹底解説かもしれない？？
2. RMarkdownからLaTeXを経由してPDF（論文・予稿）を出力すること
    - 現在は，日本言語学会の予稿に部分的に対応（版面・ページ番号消去）
      - 非公式・非公認
      - あくまで部分的に対応

## 将来的に出来るようにすること

[こちら](https://github.com/CLRafaelR/lingdocdown/discussions/10)のURLにてアナウンスする

https://github.com/CLRafaelR/lingdocdown/discussions/10

# このテンプレートを使うには

1. [ここ](https://github.com/CLRafaelR/lingdocdown/archive/main.zip)から，このレポジトリを丸々Zipしたファイルをダウンロード
2. お手許の環境で展開
    - フォルダ構成には適宜任意の変更を加えてよい
    - 但し，以下のファイル・フォルダのみ，動作に必要であるので，修正・削除の際は注意されたい
        1. `main.Rmd`
        2. `.latexmkrc`
        3. `drafts/`以下のファイル群
        4. `configuration/`以下のファイル群
        5. `citation/`以下のファイル群
    - 実践例は，下記のフォルダ構成の通り
3. 次のファイルをダウンロードし，各々下位ディレクトリ（フォルダ）にダウンロード
    1. `pandoc-ling.lua`
        - [ここ](https://github.com/cysouw/pandoc-ling)からダウンロード
        - `configuration/pandoc-ling`以下に格納
    2. `jecon.bst`
        - [ここ](https://github.com/ShiroTakeda/jecon-bst)からダウンロード
        - `citation/styles`以下に格納
4. [guide-installation-R-tinytex.pdf](https://github.com/CLRafaelR/lingdocdown/blob/main/manuals/guide-rmarkdown.pdf)に従って，R・RStudio・TinyTeX（・Windowsユーザはrtools40）をインストール
5. `drafts`フォルダ以下の子ファイル（拡張子`.Rmd`）を適宜編集
6. `main.Rmd`をknitし，文書生成

```
lingdocdown/
　├ main.Rmd    （親ファイル・これをknitすることでLaTeXを経由したPDFを得る）
　├ main.tex    （親ファイルからPDFを得るときに中間生成物として作られるTeXファイル）
　├ main.pdf    （親ファイルから得られるPDF）
　├ .latexmkrc  （背後で動作するLaTeXプログラムを制御するファイル）
　├ drafts/     （子ファイルを格納・子ファイルの名称・種類・数・内容は適宜変更する）
　│　├ 01-introduction.Rmd        （RMarkdown子ファイル・序論執筆用）
　│　├ 02-materials-methods.Rmd   （RMarkdown子ファイル・言語資料・方法執筆用）
　│　├ 03-results-analyses.Rmd    （RMarkdown子ファイル・分析・結果執筆用）
　│　├ 04-discussion.Rmd          （RMarkdown子ファイル・考察執筆用）
　│　├ 05-conclusion.Rmd          （RMarkdown子ファイル・結論執筆用）
　│　└ 06-1-bibliography-test.Rmd （RMarkdown子ファイル・citation/bibliography以下のbibファイルの参照テスト用）
　├ configuration/
　│　├ pandoc-ling/
　│　│　├ pandoc-ling.lua  （別途要ダウンロード・下記参照）
　│　│　└ ...
　│　├ LaTeX
　│　│　├ fig-tab-box.tex
　│　│　├ linguistic-sets.tex
　│　│　└ ...
　│　└ ...
　├ citation/
　│　├ bibliography/        （本フォルダ及びそのファイルは適宜変更する）
　│　│　├ cjk-comma-sep.bib （和文文献の書誌情報，著者の姓名がコンマで分かち書きされている）
　│　│　├ cjk.bib           （和文文献の書誌情報例）
　│　│　├ non-cjk.bib       （欧文文献の書誌情報例）
　│　│　└ ...               （必要に応じ，適宜追加すること）
　│　└ styles
　│　　　├ jcon.bst  （**このレポジトリには入っていない！** 別途要ダウンロード・下記参照）
　│　　　├ lsj.bst   （**このレポジトリには入っていない！現在開発中**）
　│　　　└ ...       （必要に応じ，適宜追加すること）
　├ manuals/
　│　├ guide-installation-R-tinytex.pdf  （R・TinyTeXのインストールガイド）
　│　└ guide-rmarkdown.pdf               （RMarkdownの紹介）
　├ data/  （**このレポジトリには入っていない！** 必要に応じ，適宜追加すること）
　│　├ csv/
　│　├ mp4/
　│　├ ...
　│　└ ext/
　└ figures/  （**このレポジトリには入っていない！** 必要に応じ，適宜追加すること）
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


<!--
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
　│　├ LaTeX
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
-->


# 許諾および免責事項（LICENSE）

本レポジトリの内容に関する取扱いは，クリエイティブ・コモンズの表示-非営利-継承4.0国際に従う。

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

# 質問がある場合には

lingdocdownに関するご質問は，[`lingdocdown`のQ&Aページ](https://github.com/CLRafaelR/lingdocdown/discussions/categories/q-a)からお受けいたします（GitHubアカウントが必要です。メールアドレスと，ご自身で設定するパスワードの2つで登録できます）。まずは，Q&Aページ内をご覧いただき，ご自身の質問に対応したものがあるかご確認をお願いします。その上で，もしご自身の質問が解決されない場合には，当該Q&Aページの右側にある[New discussion](https://github.com/CLRafaelR/lingdocdown/discussions/new)を押していただき，そこからご質問をご投稿いただきたくお願いいたします。
