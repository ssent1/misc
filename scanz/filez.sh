#! /usr/local/bin/zsh
cd "$HOME"/Downloads/0_rawScan/ || {
    print "There is nothing in $PWD."
}
for i in $(seq 1 5); do
    touch "$HOME/Downloads/0_rawScan/_rawScan_test-0$i".pdf
done

cd "$HOME"/Downloads/0_rawScan/1_binderize || {
    print "There is nothing in $PWD."
}
for i in $(seq 1 5); do
    touch "$HOME/Downloads/0_rawScan/1_binderize/_binderize_test-0$i".pdf
done

cd "$HOME"/Downloads/0_rawScan/2_optimize/ || {
    print "There is nothing in $PWD."
}
for i in $(seq 1 5); do
    touch "$HOME/Downloads/0_rawScan/2_optimize/_optimize_test-0$i".pdf
done

cd "$HOME"/Downloads/0_rawScan/3_minimize/ || {
    print "The directory\n$HOME/Downloads/0_rawScan/3_minimize/\ndoes not exist."
}
for i in $(seq 1 5); do
    touch "$HOME/Downloads/0_rawScan/3_minimize/_minimize_test-0$i".pdf
done
# if dates needed, add `-$(date +%Y%m%d_%H%M%S)` after `"` and before `.pdf`.
