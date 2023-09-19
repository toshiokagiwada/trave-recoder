#!/usr/bin/bash

#
# trave-recoderのツイ（？）を入力するスクリプト
# テンプレファイル名を引数として取らないといけないので、
# このスクリプトの起動用スクリプト（ラッパ）を用意したほうが良いですよ。
#

# 入力用エディタの設定
editorname="emacs -nw"

# ディレクトリとヘッダフッタファイルの処理、
# もしかしたら、このまま分離しなくても良いかも…

#
# ディレクトリの存在チェックをする処理
# なければ作る
#

#
# 関連する変数設定
#

# ここにこのアプリのディレクトリを設定しよう
# たぶん.bashrcで環境変数化した方がいいです
trhomedir=/home/toshio/.trave-recoder/
trbindir=${trhomedir}bin/

# ここにファイル置き場のディレクトリを設定しよう
dbdirpath=${trhomedir}textdb/

# ここまでの変数はtra-marge.shと重複しています
# はやめに共通の設定を用意しましょう。

# ここにテンプレファイルのディレクトリを設定しよう
templatedir=${trhomedir}templates
templatefilename=${templatedir}/$1

# この3つの変数に今日の日付を格納する
year=`date +"%Y"`
month=`date +"%m"`
day=`date +"%d"`

# ディレクトリ名を格納する
diryear=${year}
dirmonth=${diryear}${month}
dirtoday=${dirmonth}${day}

# 名前が変だけど、
# 置き場ディレクトリのパス + 上3つのディレクトリ名
dirnameyear=${dbdirpath}/${diryear}
dirnamemonth=${dirnameyear}/${dirmonth}
dirnameday=${dirnamemonth}/${dirtoday}

# 「年」ディレクトリがない時は作る
if [ -d ${dirnameyear}/ ]
then
    echo "this year's workdir exists."
else
    echo "making this year's workdir"
    mkdir ${dirnameyear}
fi

# 「月」ディレクトリがない時は作る
if [ -d ${dirnamemonth}/ ]
then
    echo "this month's workdir exists."
else
    echo "making this month's workdir"
    mkdir ${dirnamemonth}
fi

# 「日」ディレクトリがない時は作る
if [ -d ${dirnameday}/ ]
then
    echo "today's workdir exists."
else
    echo "making today's workdir"
    mkdir ${dirnameday}
fi

#
# ヘッダファイルとフッタファイルの存在チェック
# ない時は作るコマンドを起動する
#

# ヘッダとフッタのファイル名
hftemp=`date +"%Y%m%d"`
headerpath=${dirnameday}/0-${hftemp}-header.md
footterpath=${dirnameday}/9-${hftemp}-footter.md

# 「日」ディレクトリにヘッダファイルがない時は作る
if [ -f ${headerpath} ]
then
    echo "header file exists."
else
    echo "making header file."

    # ここにヘッダファイルを作るコマンドを挿入する
    ${trbindir}tra-header.sh ${headerpath}

fi

# 「日」ディレクトリにフッタファイルがない時は作る
if [ -f ${footterpath} ]
then
    echo "footter file exists."
else
    echo "making footter file."
    ${trbindir}tra-footter.sh ${footterpath}
fi

#
# 「日」ディレクトリに入力用ファイルを
# タイムスタンプとテンプレ付きで作成する
# その後にエディタで編集してもらう
#

filename=`date +"%Y%m%d-%H%M%S.md"`
filepath=${dirnameday}/${filename}

# タイムスタンプをファイルに追加する
date +"## %Y%m%d %H%M%S" > ${filepath}
cat ${templatefilename} >> ${filepath}

# エディタを起動する時は、
# 最初から3行目にカーソルを移動してあると捗るかも
${editorname} ${filepath}

# 最終行を空行にする
echo "" >> ${filepath}

# emacsの出力するバックアップファイル（~ファイル）をチェックし、
# あったら削除する
if [ -f ${filepath}~ ]
then
    echo "nyoro file exists. deleting."
    rm ${filepath}~
fi

echo "end"
