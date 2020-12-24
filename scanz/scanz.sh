#! /usr/local/bin/zsh
cd "$HOME"/Downloads/0_rawScan/3_minimize/ || {
    print "The directory\n$HOME/Downloads/0_rawScan/3_minimize/\ndoes not exist."
}
min=$(find . -type f -maxdepth 1 | wc -l)
    if [ "$min" -eq 0 ]; then
    print "There is nothing in $PWD."
    else
        mv -i "$HOME"/Downloads/0_rawScan/3_minimize/*.pdf "$HOME"/Downloads/0_rawScan/Ω-archive/
    fi

cd "$HOME"/Downloads/0_rawScan/2_optimize/ || {
    print "There is nothing in $PWD."
}
opt=$(find . -type f -maxdepth 1 | wc -l)
    if [ "$opt" -eq 0 ]; then
    exit
    else
        mv -i "$HOME"/Downloads/0_rawScan/2_optimize/*.pdf "$HOME"/Downloads/0_rawScan/99_trash/
    fi

cd "$HOME"/Downloads/0_rawScan/1_binderize || {
    print "There is nothing in $PWD."
}
bnd=$(find . -type f -maxdepth 1 | wc -l)
    if [ "$bnd" -eq 0 ]; then
    exit
    else
        mv -i "$HOME"/Downloads/0_rawScan/1_binderize/*.pdf "$HOME"/Downloads/0_rawScan/99_trash/
    fi

cd "$HOME"/Downloads/0_rawScan/ || {
    print "There is nothing in $PWD."
}
raw=$(find . -type f -maxdepth 1 | wc -l)
    if [ "$raw" -eq 0 ]; then
    exit
    else
        mv -i "$HOME"/Downloads/0_rawScan/*.pdf "$HOME"/Downloads/0_rawScan/99_trash/
    fi
print 'Done!'
cd "$HOME"/Code/misc/linkz/
./linkz.sh

