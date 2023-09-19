#!/usr/bin/bash

# テンプレートを引数にしてtr-add.shを起動する
# evening.tempは1日の終わりに書き込みます

trhomedir=/home/toshio/.trave-recoder/
trbindir=${trhomedir}bin/

${trbindir}tra-add.sh evening.temp
