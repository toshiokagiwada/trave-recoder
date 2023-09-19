#!/usr/bin/bash

#
# trave-recoderで作成したツイファイル（？）を
# まとめてその日の日報にするスクリプト
#
# ファイルをマージするスクリプトがあるので、
# それを起動して、標準出力をその日の日付のファイルにする

# ここにこのアプリのディレクトリを設定しよう
# たぶん.bashrcで環境変数化した方がいいです
trhomedir=/home/toshio/.trave-recoder/
trbindir=${trhomedir}bin/

# ここにファイル置き場のディレクトリを設定しよう
dbdirpath=${trhomedir}textdb/

# ここまでの設定、tra-add.shと重複しているので、
# 環境変数化するか、設定用スクリプトを別に設定すべき

# この3つの変数に今日の日付を格納する
year=`date +"%Y"`
month=`date +"%m"`
day=`date +"%d"`

filename=`date +"%Y%m%d"`.md

# ここに日報ファイルの置き場を設定しよう
outputpath=/home/toshio/myenv/docs/nippo/
outfile=${outputpath}${filename}

if [ -d ${outputpath} ]
then
    ${trbindir}tra-marge.sh ${year} ${month} ${day} > ${outfile}
    cat ${outfile}
else
    echo "target dir ${outputpath} isn't exist."
fi
