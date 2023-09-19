#!/usr/bin/bash

# ヘッダファイルを作る
# 引数はフルパスのファイル名

year=`date +"%Y"`
month=`date +"%m"`
day=`date +"%d"`
weekday=`date +"%A"`

echo "# トレードの記録 ${year}年${month}月分" > $1
echo "## ${year}年${month}月${day}日（${weekday}）" >> $1
echo "" >> $1
