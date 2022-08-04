VERSION=0.9

DEBUG=-g # -pg
CFLAGS+=-Wall -Ofast -DVERSION=\"${VERSION}\" $(DEBUG)
LDFLAGS=-lgpgme $(DEBUG)

OBJS=nasty.o

all: nasty

nasty: $(OBJS)
	$(CC) -Wall -W $(OBJS) $(LDFLAGS) -o nasty

install: nasty
	cp nasty /usr/bin

clean:
	rm -f $(OBJS) nasty core

package: clean
	mkdir nasty-$(VERSION)
	cp *.c Makefile README.md nasty-$(VERSION)
	tar czf nasty-$(VERSION).tgz nasty-$(VERSION)
	rm -rf nasty-$(VERSION)
