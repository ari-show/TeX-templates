# TeX Templates

東京都市大学の卒業論文向け LaTeX テンプレートです．upLaTeX，BibTeX，VS Code Dev Containers，textlint を使える構成にしています．

## ディレクトリ構成

```
.
├── Dockerfile
├── compose.yaml
├── contents/
│   ├── 01_introduction.tex : 序論
│   ├── 02_preparation.tex : 準備
│   ├── 03_default_method.tex : 関連研究
│   ├── 04_propose_method.tex : 提案手法
│   ├── 05_experiment.tex : 実験
│   ├── 06_consideration.tex : 考察
│   ├── 07_conclusion.tex : 結論
│   ├── 08_acknowledgements.tex : 謝辞
│   ├── appendix.tex : 付録
│   └── cover.tex : 表紙
├── images/ : 図を配置する
├── src/ : ソースコードを配置する
├── latexmkrc : LaTeX 環境やコンパイルなどの設定ファイル
├── proceedings.bib : 学会名などの BibTeX マクロ
├── ref.bib : 参考文献を記述する
└── thesis.tex : メインファイル
```

## 使い始める

1. `thesis.tex` のタイトル，氏名，学籍番号，提出日を変更する．
2. `contents/cover.tex` の表紙情報を変更する．
3. `contents/` 配下の各章に本文を書く．
4. 図は `images/` に配置する．
5. 参考文献は `ref.bib` に追加する．

## 環境起動

```bash
# コンテナを起動してシェルに入る
docker compose run --rm texlive bash
```

## PDF の生成

コンテナ内で以下を実行します．

```bash
latexmk thesis.tex
```

VS Code Dev Containers を使う場合は，開発コンテナに入った状態で `thesis.tex` を保存すると LaTeX Workshop の設定でビルドできます．

## 環境について

- Ubuntu 22.04
- TeX Live
- upLaTeX
- latexmk
- textlint

## 参考文献

文献は [ref.bib](./ref.bib) に記述します．

```bib
@article{example2023,
  author    = {John Doe and Jane Smith},
  title     = {An Example Article},
  journal   = {Journal of Examples},
  year      = {2023},
  volume    = {42},
  number    = {1},
  pages     = {1--10},
  month     = jan,
  note      = {An optional note},
  doi       = {10.1234/example.2023.42.1},
}
```

本文中では BibTeX のキーを指定して引用します．

```tex
\cite{example2023}
```

## textlint

```bash
npx textlint "contents/**/*.tex" thesis.tex
```

日本語の工学系論文向けルールプリセットを使用し，句読点を「，」「．」に統一する設定にしています．
