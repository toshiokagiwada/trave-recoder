#!/usr/bin/bash

# テンプレートを引数にしてtr-add.shを起動する
# after-trade.tempはトレード後の結果と総評です

trhomedir=/home/toshio/.trave-recoder/
trbindir=${trhomedir}bin/

${trbindir}tra-add.sh after-trade.temp

