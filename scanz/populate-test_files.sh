#! /usr/local/bin/zsh
for i in `seq 1 5`; touch $HOME/Downloads/0_rawScan/_rawScan_test-0"$i".pdf &&
for i in `seq 1 5`; touch $HOME/Downloads/0_rawScan/1_binderize/_binderize_test-0"$i".pdf &&
for i in `seq 1 5`; touch $HOME/Downloads/0_rawScan/2_optimize/_optimize_test-0"$i".pdf &&
for i in `seq 1 5`; touch $HOME/Downloads/0_rawScan/3_minimize/_minimize_test-0"$i".pdf
