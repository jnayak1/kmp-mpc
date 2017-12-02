sudo apt-get update
sudo apt-get install git

cd ~
git clone https://github.com/samee/sqrtOram.git
git clone https://github.com/samee/obliv-c.git

cd obliv-c
sudo apt-get install ocaml libgcrypt20-dev ocaml-findlib
./configure && make

cd ../sqrtOram
export OBLIVC_PATH=~/obliv-c
export SQR_ORAM_PATH=~/sqrtOram
make
