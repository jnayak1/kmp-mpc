FROM ubuntu:18.04

# Install dependencies
RUN apt-get update
RUN apt-get install -y git

# Clone dependencies
RUN git clone https://github.com/samee/obliv-c.git
RUN git clone https://github.com/drn98/sqrtOram.git

# Export run-time environment variables
ENV SQR_ORAM_PATH=/sqrtOram
ENV OBLIVC_PATH=/obliv-c

# Setup obliv-c
RUN apt-get install -y ocaml libgcrypt20-dev ocaml-findlib opam m4 ocamlbuild
RUN cd obliv-c && ./configure && make

# Setup sqrtOram
ARG OBLIVC_PATH=/obliv-c
RUN cd sqrtOram && make

# Setup kmp-mpc
RUN mkdir kmp-mpc
COPY . ./kmp-mpc
ARG SQR_ORAM_PATH=/sqrtOram
RUN cd kmp-mpc && MAX_PATTERN_LENGTH=4 MAX_TEXT_LENGTH=256 make

CMD ["/bin/bash"]
