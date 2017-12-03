#!/usr/bin/sh


sleep_time=1
host="localhost"

# small pattern increase text size
MAX_PATTERN_LENGTH=4 MAX_TEXT_LENGTH=8 make
./a.out 2345 $host test_patterns/pattern1.txt
sleep $sleep_time
MAX_PATTERN_LENGTH=4 MAX_TEXT_LENGTH=16 make
./a.out 2345 $host test_patterns/pattern1.txt
sleep $sleep_time
MAX_PATTERN_LENGTH=4 MAX_TEXT_LENGTH=32 make
./a.out 2345 $host test_patterns/pattern1.txt
sleep $sleep_time
MAX_PATTERN_LENGTH=4 MAX_TEXT_LENGTH=64 make
./a.out 2345 $host test_patterns/pattern1.txt
sleep $sleep_time
MAX_PATTERN_LENGTH=4 MAX_TEXT_LENGTH=128 make
./a.out 2345 $host test_patterns/pattern1.txt
sleep $sleep_time
MAX_PATTERN_LENGTH=4 MAX_TEXT_LENGTH=256 make
./a.out 2345 $host test_patterns/pattern1.txt
sleep $sleep_time
MAX_PATTERN_LENGTH=4 MAX_TEXT_LENGTH=512 make
./a.out 2345 $host test_patterns/pattern1.txt
sleep $sleep_time
MAX_PATTERN_LENGTH=4 MAX_TEXT_LENGTH=1024 make
./a.out 2345 $host test_patterns/pattern1.txt
sleep $sleep_time
MAX_PATTERN_LENGTH=4 MAX_TEXT_LENGTH=2048 make
./a.out 2345 $host test_patterns/pattern1.txt
sleep $sleep_time
MAX_PATTERN_LENGTH=4 MAX_TEXT_LENGTH=4096 make
./a.out 2345 $host test_patterns/pattern1.txt
sleep $sleep_time
MAX_PATTERN_LENGTH=4 MAX_TEXT_LENGTH=8192 make
./a.out 2345 $host test_patterns/pattern1.txt
sleep $sleep_time

# small text, increase patter size
MAX_PATTERN_LENGTH=1 MAX_TEXT_LENGTH=256 make
./a.out 2345 $host test_patterns/pattern1.txt
sleep $sleep_time
MAX_PATTERN_LENGTH=4 MAX_TEXT_LENGTH=256 make
./a.out 2345 $host test_patterns/pattern4.txt
sleep $sleep_time
MAX_PATTERN_LENGTH=5 MAX_TEXT_LENGTH=256 make
./a.out 2345 $host test_patterns/pattern5.txt
sleep $sleep_time
MAX_PATTERN_LENGTH=8 MAX_TEXT_LENGTH=256 make
./a.out 2345 $host test_patterns/pattern8.txt
sleep $sleep_time
MAX_PATTERN_LENGTH=16 MAX_TEXT_LENGTH=256 make
./a.out 2345 $host test_patterns/pattern16.txt
sleep $sleep_time
MAX_PATTERN_LENGTH=64 MAX_TEXT_LENGTH=256 make
./a.out 2345 $host test_patterns/pattern64.txt
sleep $sleep_time
MAX_PATTERN_LENGTH=128 MAX_TEXT_LENGTH=256 make
./a.out 2345 $host test_patterns/pattern128.txt


