# kmp-mpc
Oblivious substring search using Obliv-C, sqrtOram and Knuth-Morris-Pratt.

## Introduction
One party wants to be able to determine whether its substring is in another party's text. However, both parties want to keep their input private. This multi-party computation (MPC) problem, known as oblivious substring search, can be found across several different fields. In bioinformatics, for example, people might want to allow a company to search their DNA for a particular proprietary pattern, while maintaining privacy.

kmp-mpc uses [Obliv-C](https://github.com/samee/obliv-c) as a MPC framework. It creates a new variation of the substring search algorithm Knuth-Morris-Pratt to accomodate for Obliv-C's restrictions on oblivious conditional statements and indexing into arrays. To keep memory access patterns hidden, all oblivious indexing into arrays use ORAM. Rather than use the naive solution of reading at each index to hide memory access patterns, this implementation uses [sqrtOram](https://github.com/samee/sqrtOram) reducing the time complexity of oblivious lookups from linear to square-root order.

## Test Results
Tests were conducted on two AWS c4.2xlarge nodes. The tests found a linear relationship between text size and run time and a square-root relationship between pattern size and run time.

|pattern length|text length|yao gate count| time (s) |
| ------------ | --------- | ------------ | -------- | 
|1             |8192       |26463069      |11.218935 | 
|2             |8192       |49098407      |17.547319 |
|4             |8192       |93141927      |29.464218 |
|8             |8192       |103474839     |35.518375 |
|16            |8192       |169806418     |54.114391 |
|32            |8192       |281146357     |86.611352 |
|64            |8192       |474221756     |142.644258|

<img width="533" alt="screen shot 2018-06-22 at 10 09 39 pm" src="https://user-images.githubusercontent.com/11620890/41804695-09bdf66e-7669-11e8-9903-f9aa4488825e.png">

| text length | yao gate count| time (s)   |
| ----------- | ------------- | ---------- |
|  8           |153501         |0.363900   |
|  16          |221533         |0.371387   |
|  32          |369885         |0.422282   |
|  64          |715741         |0.509723   |
|  128         |1442328        |0.739889   |
|  256         |2895694        |1.217106   |
|  512         |5803194        |2.093564   |
|  1024        |11621266       |3.894311   |
|  2048        |23269698       |7.820184   |
|  4096        |46615714       |14.810030  |
|  8192        |93141927       |29.353847  |
|  16384       |186194545      |59.187216  |
|  32768       |372300549      |120.202773 |
|  65536       |744515629      |231.481555 |

<img width="546" alt="screen shot 2018-06-22 at 10 09 24 pm" src="https://user-images.githubusercontent.com/11620890/41804706-4cd4295a-7669-11e8-900c-af347335d08a.png">

## Installation
- Clone and install [Obliv-C](https://github.com/samee/obliv-c#installation)
- Clone and install [sqrOram](https://github.com/samee/sqrtOram)

`git clone https://github.com/jnayak1/kmp-mpc.git`

`export OBLIVC_PATH=/path/to/obliv-c`

`export SQR_ORAM_PATH=/path/to//sqrtOram`

## Running
`MAX_PATTERN_LENGTH=4 MAX_TEXT_LENGTH=256 make`

`./a.out [port] -- text.txt &` -- server

`./a.out [port] [host] pattern.txt` -- client




 



