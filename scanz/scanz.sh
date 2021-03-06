#! /usr/local/bin/zsh

cd "$HOME"/Downloads/0_rawScan/3_minimize/ || {
    print "The directory\n$HOME/Downloads/0_rawScan/3_minimize/\ndoes not exist."
}
min=$(find . -type f -maxdepth 1 | wc -l)
if [ "$min" -le 1 ]; then
    print "There is nothing in \'$(basename $PWD)\'."
    return
else
    pdf=$(find . -type f -maxdepth 1 -iname "*.pdf" | wc -l)
    if [ "$pdf" -eq 0 ]; then
        print "There are no PDFs in \'$(basename $PWD)\'."
    else
        for h in *.pdf; do
            base=$(basename "$h" .pdf)
            tar -czf "$HOME/Downloads/0_rawScan/77_archivze/$base-$(date +%Y%m%d_%H%M%S)".pdf.tar.gz "$h"
            mv -n "$h" "$HOME/Downloads/0_rawScan/Ω-archive/$base-$(date +%Y%m%d_%H%M%S)".pdf
        done
    fi
    dir=$(find ./* -type d -maxdepth 1 -iname "*" | wc -l)
    if [ "$dir" -eq 0 ]; then
        print "There are no directories in \'$(basename $PWD)\'."
        return
    else
        for m in */; do
            base_m=$(basename "$m")
            tar -czf "$HOME/Downloads/0_rawScan/77_archivze/$base_m-$(date +%Y%m%d_%H%M%S)".tar.gz --directory="$m" .
            mv -n "$m/" "$HOME/Downloads/0_rawScan/Ω-archive/$base_m/"
        done
    fi
fi
# Creates Gzip archive with ISO date from minified PDFs and directories.
# Moves compressed archives to `77-archivze` and moves PDFs to `Ω-archive`.

cd "$HOME"/Downloads/0_rawScan/2_optimize/ || {
    print "There is nothing in $PWD."
}
opt=$(find . -type f -maxdepth 1 | wc -l)
if [ "$opt" -eq 0 ]; then
    exit
else
    for j in *.pdf; do
        base=$(basename "$j" .pdf)
        mv -n "$j" "$HOME/Downloads/0_rawScan/99_trash/$base-$(date +%Y%m%d_%H%M%S)".pdf
    done
fi
# Clears out PDFs in `2_optimize` by adding ISO date and moving the files to `99_trash`.

cd "$HOME"/Downloads/0_rawScan/1_binderize || {
    print "There is nothing in $PWD."
}
bnd=$(find . -type f -maxdepth 1 | wc -l)
if [ "$bnd" -eq 0 ]; then
    exit
else
    for k in *.pdf; do
        base=$(basename "$k" .pdf)
        mv -n "$k" "$HOME/Downloads/0_rawScan/99_trash/$base-$(date +%Y%m%d_%H%M%S)".pdf
    done
    for k in *.ai; do
        base=$(basename "$k" .ai)
        mv -n "$k" "$HOME/Downloads/0_rawScan/99_trash/$base-$(date +%Y%m%d_%H%M%S)".ai
    done
fi
# Clears out AIs and PDFs in `1_binderize` by adding ISO date and moving the files to `99_trash`.

cd "$HOME"/Downloads/0_rawScan/ || {
    print "There is nothing in $PWD."
}
raw=$(find . -type f -maxdepth 1 | wc -l)
if [ "$raw" -eq 0 ]; then
    exit
else
    for h in *.pdf; do
        base=$(basename "$h" .pdf)
        mv -n "$h" "$HOME/Downloads/0_rawScan/99_trash/$base-$(date +%Y%m%d_%H%M%S)".pdf
    done
fi

print 'Done!'
cd "$HOME"/Code/misc/linkz/ || {
    print "The directory\n$HOME/Code/misc/linkz/\ndoes not exist."
}
./linkz.sh
