#! /bin/zsh
cd "$HOME"/Downloads/0_rawScan/0_templatize/ || {
    print "The directory\n$HOME/Downloads/0_rawScan/0_templatize/\ndoes not exist."
}
min=$(find . -type f -name '*.pdf' -maxdepth 1 | wc -l)
    if [ "$min" -eq 0 ]; then
    print "There are no PDFs in $PWD."
    else
        ln -f "$HOME"/Downloads/0_rawScan/0_templatize/*.pdf "$HOME"/Downloads/0_rawScan/1_binderize/
    fi
printf "%s\n \n###########################################################\n$min hard links have been created in 1_binderize.\n###########################################################\n"
cd "$HOME" || return
