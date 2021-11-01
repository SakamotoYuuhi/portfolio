# 公式からpython3.9 on alpine linuxイメージをpull
FROM python:3.9-alpine

# 環境変数を設定
# Pythonがpyc filesとdiscへ書き込むことを防ぐ
ENV PYTHONDONTWRITEBYTECODE 1
# Pythonが標準入出力をバッファリングすることを防ぐ
ENV PYTHONUNBUFFERED 1

# ホストのカレントディレクトリ（portfolioディレクトリ）を作業ディレクトリにコピー
COPY . /portfolio/
# 作業ディレクトリを設定
WORKDIR /portfolio/Application/

# Pipenvをインストール
RUN pip install --upgrade pip && \
    pip install pipenv

# PipfileからパッケージをインストールしてDjango環境を構築
# NOTE:オプションコマンド
#      --skip-lock:Pipfile.lockを無視して
#      --system:Pipfileからパッケージを読み込み
#      --dev:開発環境にのみ反映
# 苦戦NOTE:読み込むPipfileは頭文字が大文字のPでないと読み込んでくれない
RUN pipenv install --skip-lock --system --dev