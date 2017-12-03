#!/bin/bash


echo "match, pattern length, text length, yao gate count, time"
# small pattern, increase text size
tlen=8
for i in `seq 1 14`;
    do
        MAX_PATTERN_LENGTH=4 MAX_TEXT_LENGTH=$tlen make
        ./a.out 2345 -- text.txt
        tlen=$tlen*2
    done

echo "match, pattern length, text length, yao gate count, time"
# large text, increase pattern size
plen=1
for i in `seq 1 8`;
    do
        MAX_PATTERN_LENGTH=$plen MAX_TEXT_LENGTH=8192 make
        ./a.out 2345 -- text.txt
        plen=$plen*2
    done
