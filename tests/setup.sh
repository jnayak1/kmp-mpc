#!/bin/bash

# Setup for ubuntu
# execute with source:
# . setup.sh

sudo apt-get update
sudo apt-get install git
sudo apt-get install make

cd ~
git clone https://github.com/samee/sqrtOram.git
git clone https://github.com/samee/obliv-c.git

cd obliv-c
sudo apt-get install ocaml libgcrypt20-dev ocaml-findlib
./configure && make

cd ../sqrtOram
export OBLIVC_PATH="/home/ubuntu/obliv-c"
export SQR_ORAM_PATH="/home/ubuntu/sqrtOram"
