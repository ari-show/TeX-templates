#!/usr/bin/env perl

# コンパイラをuplatexに変更
$latex = 'uplatex -shell-escape -synctex=1 -halt-on-error -file-line-error';
$bibtex = 'upbibtex';
$makeindex = 'mendex';

# PDF生成の設定
$dvipdf = 'dvipdfmx %O -o %D %S';
$pdf_mode = 3;

# macOS用プレビューアの設定
$pdf_previewer = 'open -a /Applications/Preview.app';
$pdf_update_method = 4;
$pdf_update_command = 'open -a Preview %S';