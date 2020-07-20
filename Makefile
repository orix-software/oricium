AS=xa
CO=co65
CC=cl65

PROGRAM=oricium

HOMEDIR=/home/travis/bin/
HOMEDIR_PROGRAM=/home/travis/build/orix-software/$(PROGRAM)

all : oricium
.PHONY : all

CFLAGS=-ttelestrat


ifdef TRAVIS_BRANCH
ifeq ($(TRAVIS_BRANCH), master)
RELEASE:=$(shell cat VERSION)
else
RELEASE=alpha
endif
endif



#SOURCE=main.c
#ASFLAGS=-v -R -cc -DTARGET_FILEFORMAT_O65

#$(PROGRAM): README.md
#	cp README.md toto


test:
	mkdir -p build/bin/
	cp RELEASE/orix/usr/bin/oricium build/bin/$(PROGRAM)
	cd build && tar -c * > ../$(PROGRAM).tar && cd ..
	filepack  $(PROGRAM).tar $(PROGRAM).pkg
	gzip $(PROGRAM).tar
	mv $(PROGRAM).tar.gz $(PROGRAM).tgz
	php buildTestAndRelease/publish/publish2repo.php $(PROGRAM).tgz ${hash} 6502 tgz $(RELEASE)
	echo nothing
