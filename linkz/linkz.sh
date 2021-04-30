#! /bin/zsh
cd "$HOME"/Downloads/0_rawScan/0_templatize/ || {
    print "The directory\n$HOME/Downloads/0_rawScan/0_templatize/\ndoes not exist."
}
min=$(find . -type f -maxdepth 1 -name '*.pdf' -or -name '*.ai' | wc -l)
if [ "$min" -eq 0 ]; then
    print "There are no AI or PDF filess in $PWD."
else

    for i in *.ai; do
        ln -f "$i" "$HOME"/Downloads/0_rawScan/1_binderize/
    done

    for i in *.pdf; do
        ln -f "$i" "$HOME"/Downloads/0_rawScan/1_binderize/
    done

fi
printf "%s\n \n###########################################################\n$min hard links have been created in 1_binderize.\n###########################################################\n"
cd "$HOME" || return
