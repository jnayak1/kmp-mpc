#!/bin/bash


sleep_time=1
host="localhost"

rm text_length.csv
touch text_length.csv

echo "match, pattern length, text length, yao gate count, time" >> text_length.csv

# small pattern increase text size
tlen=8
for i in `seq 1 11`;
    do
        MAX_PATTERN_LENGTH=4 MAX_TEXT_LENGTH=$tlen make
        ./a.out 2345 $host text.txt >> text_length.csv
        tlen=$tlen*2
        sleep $sleep_time
    done


rm pattern_length.csv
touch pattern_length.csv

echo "match, pattern length, text length, yao gate count, time" >> pattern_length.csv

# large text, increase pattern size
plen=1
for i in `seq 1 8`;
    do
        MAX_PATTERN_LENGTH=$plen MAX_TEXT_LENGTH=8192 make
        ./a.out 2345 $host text.txt >> pattern_length.csv
        plen=$plen*2
        sleep $sleep_time
    done

