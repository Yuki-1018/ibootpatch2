CC		= gcc
SOURCE	= patch.c offsetfinder.c

UNAME  := $(shell uname)
ifeq ($(UNAME), Darwin)
ARCH	= -arch x86_64 -arch arm64
else
ARCH	=
endif

CFLAGS	=
BIN		= iBootpatch2

VERSION = $(shell git rev-parse HEAD | tr -d '\n')-$(shell git rev-list --count HEAD | tr -d '\n')

.PHONY: all clean

all:
	$(CC) $(SOURCE) $(ARCH) $(CFLAGS) -DVERSION=\"$(VERSION)\" -o $(BIN)
	
clean:
	-$(RM) $(BIN)
