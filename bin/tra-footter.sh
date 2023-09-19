#!/usr/bin/bash

# フッタファイルを作る
# 引数はフルパスのファイル名

year=`date +"%Y"`
month=`date +"%m"`
day=`date +"%d"`
weekday=`date +"%A"`

echo "以上" > $1
echo "" >> $1
