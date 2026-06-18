FROM ubuntu:22.04

# タイムゾーン設定（対話モード回避）
ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# 必要なパッケージのインストール
RUN apt-get update && apt-get install -y \
    texlive-full \
    texlive-lang-japanese \
    texlive-lang-cjk \
    texlive-extra-utils \
    latexmk \
    gzip \
    zip \
    git \
    unzip \
    make \
    curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# 日本語フォントのインストール
RUN apt-get update && apt-get install -y \
    fonts-ipafont \
    fonts-ipaexfont \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# 作業ディレクトリの作成
RUN mkdir -p /work/tex /work/output
WORKDIR /work

# 環境変数の設定
ENV LANG=ja_JP.UTF-8

# Node.js 18 をインストール（公式リポジトリ使用）
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
    && apt-get install -y nodejs \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Node.js パッケージのインストール
ENV PATH=/work/node_modules/.bin:$PATH
COPY package.json /work/
COPY package-lock.json /work/
RUN npm install