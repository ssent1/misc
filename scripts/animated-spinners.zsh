#!/bin/zsh
# 3-frame animated angle bracket spinner
while true;
do
    printf "\r< Loading.  "
    sleep 0.333333333
    printf "\r- Loading.. "
    sleep 0.333333333
    printf "\r> Loading..."
    sleep 0.333333333
done


#!/bin/bash
sleep 5 &
pid=$!
frames="/ | \\ -"
while kill -0 $pid 2&>1 > /dev/null;
do
    for frame in $frames;
    do
        printf "\r$frame Loading..." 
        sleep 0.5
    done
done
printf "\n"
