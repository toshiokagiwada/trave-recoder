#!/usr/bin/bash

#
# trave-recoderで作成したツイファイル（？）を
# 指定日だけマージするスクリプト
# 「その日のファイルをマージする」ラッパも作ろうね。
#
# ひとまず3つの引数（年、月、日）をとって、
# その日のディレクトリ配下のファイルをマージして、
# 標準出力に出力するようにする
#

# ここにこのアプリのディレクトリを設定しよう
# たぶん.bashrcで環境変数化した方がいいです
trhomedir=/home/toshio/.trave-recoder/
trbindir=${trhomedir}bin/

# ここにファイル置き場のディレクトリを設定しよう
dbdirpath=${trhomedir}textdb/

# ここまでの設定、tra-add.shと重複しているので、
# 環境変数化するか、設定用スクリプトを別に設定すべき

year=$1
month=$2
day=$3

workdir=${dbdirpath}${year}/${year}${month}/${year}${month}${day}/

if [ -d ${workdir} ]
then
    cat ${workdir}/*
else
    echo "target dir ${workdir} isn't exist."
fi
