AS=xa
CO=co65
CC=cl65

PROGRAM=oricium

HOMEDIR=/home/travis/bin/
HOMEDIR_PROGRAM=/home/travis/build/orix-software/$(PROGRAM)

all : oricium
.PHONY : all

CFLAGS=-ttelestrat



#SOURCE=main.c
#ASFLAGS=-v -R -cc -DTARGET_FILEFORMAT_O65

$(PROGRAM): README.md
	cp README.md toto


test:
	mkdir -p build/bin/
