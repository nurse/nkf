CC = cc
CFLAGS = -g -O2 -Wall -pedantic
# CFLAGS = -O3
SHAR = shar 
# SHAR = shar -T
PERL = perl
RM = rm -rf
VERSION = 2.1.5
MKDIR = mkdir
prefix = /usr/local
PYTHON2 = python
PYTHON3 = python

.PHONY: clean install test tar shar

nkf : nkf.o utf8tbl.o
	$(CC) $(CFLAGS) $(LDFLAGS) -o nkf nkf.o utf8tbl.o

nkf.o : nkf.c nkf.h utf8tbl.h config.h
	$(CC) $(CFLAGS) -c nkf.c

utf8tbl.o : utf8tbl.c utf8tbl.h config.h
	$(CC) $(CFLAGS) -c utf8tbl.c

clean:
	-$(RM) nkf.o nkf nkf.exe nkf.in nkf.out nkf-$(VERSION) *~ *.bad utf8tbl.o
	cd NKF.mod; if [ -f Makefile ]; then make clean; fi

test:	nkf
	$(PERL) test.pl

perl:
	( cd NKF.mod ; \
	$(PERL) Makefile.PL  ; \
	make ; \
	make test )

python2:
	( cd NKF.python2 ; \
	$(PYTHON2) setup.py build )

python3:
	( cd NKF.python3 ; \
	$(PYTHON3) setup.py build )

install: install-main install-man install-man-ja

install-main:
	-$(MKDIR) $(prefix)/bin
	cp -f nkf $(prefix)/bin/

install-man:
	-$(MKDIR) $(prefix)/man
	-$(MKDIR) $(prefix)/man/man1
	cp -f nkf.1 $(prefix)/man/man1/

install-man-ja:
	-$(MKDIR) $(prefix)/man/ja
	-$(MKDIR) $(prefix)/man/ja/man1
	cp -f nkf.1j $(prefix)/man/ja/man1/nkf.1

shar:
	-mkdir nkf-$(VERSION)
	-mkdir nkf-$(VERSION)/NKF.mod
	for file in  `cat MANIFEST`;  \
	do  \
	    nkf -j -m0 $$file > nkf-$(VERSION)/$$file ; \
	done 
	echo "#!/bin/sh" >nkf-$(VERSION).shar
	echo "mkdir nkf-$(VERSION)" >>nkf-$(VERSION).shar
	echo "mkdir nkf-$(VERSION)/NKF.mod" >>nkf-$(VERSION).shar
	echo "cd nkf-$(VERSION)" >>nkf-$(VERSION).shar
	( cd nkf-$(VERSION) ; $(SHAR)  `cat ../MANIFEST` ) >> nkf-$(VERSION).shar
	-$(RM) nkf-$(VERSION)

tar:
	-mkdir nkf-$(VERSION)
	-mkdir nkf-$(VERSION)/NKF.mod
	-mkdir nkf-$(VERSION)/NKF.python2
	-mkdir nkf-$(VERSION)/NKF.python3
	-mkdir nkf-$(VERSION)/man
	for file in  `cat MANIFEST`;  \
	do  \
	    cp $$file nkf-$(VERSION)/$$file ; \
	done 
	tar cf nkf-$(VERSION).tar nkf-$(VERSION)
	-$(RM) nkf-$(VERSION)
