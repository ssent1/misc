#! /usr/local/bin/zsh
cd "$HOME"/Downloads/0_rawScan/3_minimize/ || {
    print "The directory\n$HOME/Downloads/0_rawScan/3_minimize/\ndoes not exist."
}
min=$(find . -type f -maxdepth 1 | wc -l)
if [ "$min" -eq 0 ]; then
    print "There is nothing in $PWD."
else
    for i in *.pdf; do
        base=$(basename "$i".pdf)
        tar -czf "$HOME/Downloads/0_rawScan/77_archivze/$base-$(date +%Y%m%d_%H%M%S)".pdf.tar.gz "$i" &&
            mv -i "$i" "$HOME/Downloads/0_rawScan/Ω-archive/$base".pdf
    done
fi

cd "$HOME"/Downloads/0_rawScan/2_optimize/ || {
    print "There is nothing in $PWD."
}
opt=$(find . -type f -maxdepth 1 | wc -l)
if [ "$opt" -eq 0 ]; then
    exit
else
    for j in *.pdf; do
        base=$(basename "$j".pdf)
        mv -i "$j" "$HOME/Downloads/0_rawScan/2_optimize/$base-$(date +%Y%m%d_%H%M%S)".pdf
    done
fi

cd "$HOME"/Downloads/0_rawScan/1_binderize || {
    print "There is nothing in $PWD."
}
bnd=$(find . -type f -maxdepth 1 | wc -l)
if [ "$bnd" -eq 0 ]; then
    exit
else
    for k in *.pdf; do
        base=$(basename "$k".pdf)
        mv -i "$k" "$HOME/Downloads/0_rawScan/1_binderize/$base-$(date +%Y%m%d_%H%M%S)".pdf
    done
fi

cd "$HOME"/Downloads/0_rawScan/ || {
    print "There is nothing in $PWD."
}
raw=$(find . -type f -maxdepth 1 | wc -l)
if [ "$raw" -eq 0 ]; then
    exit
else
    for l in *.pdf; do
        base=$(basename "$l".pdf)
        mv -i "$l" "$HOME/Downloads/0_rawScan/99_trash/$base-$(date +%Y%m%d_%H%M%S)".pdf
    done
fi
print 'Done!'
cd "$HOME"/Code/misc/linkz/ || {
    print "The directory\n$HOME/Code/misc/linkz/\ndoes not exist."
}
./linkz.sh

