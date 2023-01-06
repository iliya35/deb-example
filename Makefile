prefix	= /usr/local
SHELL	= /bin/bash

TARGET     = helloworld
DESTDIR    = 
VERSION	   = $(shell cat VERSION)

DEFINES    = -DVERSION=\"$(VERSION)\"
CFLAGS     = -O2 -Wall -Wextra $(DEFINES)
INCPATH    = -I. 
LIBS       = -L.

GCC    = $(CC)  $(CFLAGS)   $(LIBS) $(INCPATH)

all: clean src/$(TARGET)

src/$(TARGET): src/main.c
	@echo "CFLAGS=$(CFLAGS)" | \
		fold -s -w 70 | \
		sed -e 's/^/# /'
	$(GCC)  -o $@ $^

install: src/$(TARGET)
	install -D src/$(TARGET) \
		$(DESTDIR)$(prefix)/bin/$(TARGET)

clean:
	-rm -f src/$(TARGET)

distclean: clean

uninstall:
	-rm -f $(DESTDIR)$(prefix)/bin/$(TARGET)

.PHONY: all install clean distclean uninstall