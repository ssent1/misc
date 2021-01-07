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
        zmv '/Users/syd/Downloads/0_rawScan/2_optimize/(*)(.pdf)' '/Users/syd/Downloads/0_rawScan/99_trash/$1_$(date +%Y%m%d_%H%M%S)$2'
    fi

cd "$HOME"/Downloads/0_rawScan/1_binderize || {
    print "There is nothing in $PWD."
}
bnd=$(find . -type f -maxdepth 1 | wc -l)
    if [ "$bnd" -eq 0 ]; then
    exit
    else
    fi
        zmv '/Users/syd/Downloads/0_rawScan/1_binderize/(*)(.pdf)' '/Users/syd/Downloads/0_rawScan/99_trash/$1_$(date +%Y%m%d_%H%M%S)$2'

cd "$HOME"/Downloads/0_rawScan/ || {
    print "There is nothing in $PWD."
}
raw=$(find . -type f -maxdepth 1 | wc -l)
    if [ "$raw" -eq 0 ]; then
    exit
    else
        zmv '/Users/syd/Downloads/0_rawScan/(*)(.pdf)' '/Users/syd/Downloads/0_rawScan/99_trash/$1_$(date +%Y%m%d_%H%M%S)$2'
    fi
print 'Done!'
cd "$HOME"/Code/misc/linkz/
./linkz.sh

