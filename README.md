# ディレクトリイメージ
```
.
├── Dockerfile
├── compose.yaml
├── contents/
│   ├──01_introduction.tex : 序論
│   ├──02_preparation.tex : 準備
│   ├──03_default_method.tex : 従来手法
│   ├──04_propose_method.tex : 提案手法
│   ├──05_experiment.tex : 実験
│   ├──06_conclusion.tex : 結論
│   └──appendix.tex : 付録
├──latexmkrc : LaTeX環境やコンパイルなどの設定ファイル
└──ref.bib : 参考文献を記述する
```

# 実行
## 環境起動
```bash
# コンテナを起動してシェルに入る
docker compose run --rm texlive bash

## PDFの生成
- 開発コンテナに入る
- `thesis.tex`で`⌘+S`し、保存する
```

# 環境について
- Ubuntu 22.04 
- [TeX Live](https://texwiki.texjp.org/?Linux%2FLinux%20Mint#texlive)を参考にLinuxコンテナ上でTeXを使用する環境を用意
- `.devcontainer`を使用し、cmd+sで自動的にpdfを生成する

# 書き方
## 参考文献
- 文献の記述先:[ref.bib](./proceedings.bib)
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
- 文献の参照方法
      - articleで記述した一番最初の書いた名称を入れると[1]というように出力される
      - 中の数字は参考文献の上から勝手に振られる設定
```tex
\cite{example2023}
```

# Textlintの実行方法
```bash
npx textlint .textlintrc 
```

## Textlintについて
- [日本語の工学系論文のためのルールプリセット](https://github.com/kn1cht/textlint-rule-preset-ja-engineering-paper)を使用している
- その中の[]"unify-kuten-and-touten"](https://github.com/kn1cht/textlint-rule-preset-ja-engineering-paper?tab=readme-ov-file#unify-kuten-and-touten)というルールを有効にしている
  - これは、句読点と統一するルールになっている
  - デフォルトで、「．」(全角ピリオド)「，」(全角カンマ)を使用している# TeX-templates
