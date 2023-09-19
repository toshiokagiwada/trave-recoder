#!/usr/bin/bash

# テンプレートを引数にしてtr-add.shを起動する
# before-trade.tempはトレード前の相場環境や目標設定です

trhomedir=/home/toshio/.trave-recoder/
trbindir=${trhomedir}bin/

${trbindir}tra-add.sh before-trade.temp

