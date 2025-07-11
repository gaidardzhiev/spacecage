CC=gcc
LDFLAGS=-lseccomp
BIN=isol8r

all: $(BIN)

$(BIN): %: %.c
	$(CC) -o $@ $< $(LDFLAGS)

clean:
	rm $(BIN)

install:
	cp $(BIN) /usr/bin/$(BIN)
#	cp isol8r.1 /usr/share/man/man1/

strip:
	strip -S --strip-unneeded --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag isol8r

strace:
	strace ./isol8r
