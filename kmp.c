#include<obliv.h>
#include<stdio.h>
#include<time.h>


#include"kmp.h"

double lap;


void buildDFA(protocolIO *io, char *pat){
    int x, m, j, patj, pat0;
    m = strlen(pat);

    // zero out entire array
    for (int r=0; r < CHAR_SET_LENGTH; ++r)
    {
        for (int c = 0; c < MAX_PATTERN_LENGTH; ++c)
            io->dfa[r][c] = 0;
    }

    x = 0; j = 1;

    pat0 = pat[0];
    io->dfa[pat0][0] = 1; 
    for (; j < m; ++j)
    {
        for (int c = 0; c < CHAR_SET_LENGTH; ++c)
            io->dfa[c][j] = io->dfa[c][x];
        patj = pat[j];
        io->dfa[patj][j] = j+1;
        x = io->dfa[patj][x];
    }
}


void ocTestUtilTcpOrDie(ProtocolDesc* pd,const char* remote_host,
                        const char* port)
{
    if(!remote_host) { 
        if(protocolAcceptTcp2P(pd,port)!=0) { 
            fprintf(stderr,"TCP accept failed\n");
            exit(1);
        }
    }
    else 
        if(protocolConnectTcp2P(pd,remote_host,port)!=0) { 
            fprintf(stderr,"TCP connect failed\n");
            exit(1);
        }
}

double wallClock()
{
  struct timespec t;
  clock_gettime(CLOCK_REALTIME,&t);
  return t.tv_sec+1e-9*t.tv_nsec;
}

int main(int argc,char* argv[])
{
	ProtocolDesc pd;
    protocolIO io;
    size_t newLen;
    FILE *ftxt;
    FILE *fpat;

    // party 1 holds text
    // party 2 holds pattern

    const char* remote_host = (strcmp(argv[2],"--")==0?NULL:argv[2]);
    int party = (!remote_host?1:2);

    // read in text and pattern from files
    if (party == 1)
    {
        ftxt = fopen(argv[3], "r");
        if (ftxt != NULL) {
            newLen = fread(io.txt, sizeof(char), MAX_TEXT_LENGTH, ftxt);
            if ( ferror(ftxt) != 0 ) {
                fprintf(stderr,"%s\n", "Error reading text");
            } else {
                io.txt[newLen++] = '\0';
            }
            fclose(ftxt);
        }
    }
    else {
        fpat = fopen(argv[3], "r");
        if (fpat != NULL) {
            newLen = fread(io.pat, sizeof(char), MAX_PATTERN_LENGTH, fpat);
            if ( ferror(fpat) != 0 ) {
                fprintf(stderr, "Error reading pattern");
            } else {
                io.pat[newLen++] = '\0';
            }
            fclose(fpat);
        }

        // pre-process pattern into deterministic finite state automaton
        buildDFA(&io, io.pat);
    }
  

    // protocolUseStdio(&pd);
    ocTestUtilTcpOrDie(&pd,remote_host, argv[1]);
    
    setCurrentParty(&pd,party);
    lap = wallClock();
    execYaoProtocol(&pd,kmp,&io);
    fprintf(stdout,"%lf\n",wallClock()-lap);
    cleanupProtocol(&pd);

    return 0;
}

