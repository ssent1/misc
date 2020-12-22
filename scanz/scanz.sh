#! /usr/local/bin/zsh
cd /Users/syd/Downloads/0_rawScan/3_minimize/ || {
    print 'Failure'
    exit 1
}
min=$(find . -type f -maxdepth 1 | wc -l)
    if [ "$min" -eq 0 ]; then
    exit
    else
        mv -i /Users/syd/Downloads/0_rawScan/3_minimize/*.pdf /Users/syd/Downloads/0_rawScan/Ω-archive/
    fi
cd /Users/syd/Downloads/0_rawScan/2_optimize/ || {
    print 'Failure'
    exit 1
}
opt=$(find . -type f -maxdepth 1 | wc -l)
    if [ "$opt" -eq 0 ]; then
    exit
    else
        mv -i /Users/syd/Downloads/0_rawScan/2_optimize/*.pdf /Users/syd/Downloads/0_rawScan/99_trash/
    fi
cd /Users/syd/Downloads/0_rawScan/1_binderize/*.pdf || {
    print 'Failure'
    exit 1
}
bnd=$(find . -type f -maxdepth 1 | wc -l)
    if [ "$bnd" -eq 0 ]; then
    exit
    else
        mv -i /Users/syd/Downloads/0_rawScan/1_binderize/*.pdf /Users/syd/Downloads/0_rawScan/99_trash/
    fi
cd /Users/syd/Downloads/0_rawScan/*.pdf || {
    print 'Failure'
    exit 1
}
raw=$(find . -type f -maxdepth 1 | wc -l)
    if [ "$raw" -eq 0 ]; then
    exit
    else
        mv -i /Users/syd/Downloads/0_rawScan/*.pdf /Users/syd/Downloads/0_rawScan/99_trash/
    fi
print 'Done!'