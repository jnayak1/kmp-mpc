#pragma once

#define CHAR_SET_LENGTH 128
// #define MAX_PATTERN_LENGTH 16
// #define MAX_TEXT_LENGTH 128


typedef struct protocolIO {
	int dfa[CHAR_SET_LENGTH][MAX_PATTERN_LENGTH];
	char pat[MAX_PATTERN_LENGTH];
	char txt[MAX_TEXT_LENGTH];
} protocolIO;


void kmp(void*args);
void buildDFA(protocolIO *io, char *pat);
double wallClock();
void ocTestUtilTcpOrDie();