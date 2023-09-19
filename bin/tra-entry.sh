#!/usr/bin/bash

# テンプレートを引数にしてtr-add.shを起動する
# entry.tempは手仕舞いについての情報です

trhomedir=/home/toshio/.trave-recoder/
trbindir=${trhomedir}bin/

${trbindir}tra-add.sh entry.temp

