#!/usr/bin/bash

# テンプレートを引数にしてtr-add.shを起動する
# morning.tempは朝1番のコメントです

trhomedir=/home/toshio/.trave-recoder/
trbindir=${trhomedir}bin/

${trbindir}tra-add.sh morning.temp
