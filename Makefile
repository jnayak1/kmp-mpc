OBLIVCC=$(OBLIVC_PATH)/bin/oblivcc
SQR_ORAM=$(SQR_ORAM_PATH)
CFLAGS=-DMAX_PATTERN_LENGTH=$(MAX_PATTERN_LENGTH) -DMAX_TEXT_LENGTH=$(MAX_TEXT_LENGTH)
kmp:
	$(OBLIVCC) $(CFLAGS) kmp.oc kmp.c $(SQR_ORAM)/build/liboram.a -I $(SQR_ORAM)/oram -lm