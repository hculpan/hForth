TARGET_PLATFORM=vic20
VICE_BASE=C:/Users/usucuha/retrocomputing/C64/WinVICE-2.4-x64
VICE_TARGET_VIC=$(VICE_BASE)/xvic.exe
VICE_TOOLS=$(VICE_BASE)

CC65BASE=C:/Users/usucuha/retrocomputing/C64/cc65

CC=$(CC65BASE)/bin/cc65
CA=$(CC65BASE)/bin/ca65
LD=$(CC65BASE)/bin/ld65
CO=$(CC65BASE)/bin/co65

CURRDIR=$(shell pwd)

all: mkdisk

hforth: hforth.o
	$(LD) -o hforth -t $(TARGET_PLATFORM) hforth.o $(TARGET_PLATFORM).lib

#tribal.o: tribal.c
#	$(CC) -O -t $(TARGET_PLATFORM) tribal.c
#	$(CA) tribal.s

hforth.o: hforth.s
	$(CA) -t $(TARGET_PLATFORM) hforth.s

math.o: math.s
	$(CA) -t $(TARGET_PLATFORM) math.s

clean:
	rm -f *.o
	rm -f hforth
	rm -f hforth.d64

mkdisk: hforth
	rm -f hforth.d64
	$(VICE_TOOLS)/c1541 -format hForth,1 d64 hforth.d64 8 -write hforth

run: mkdisk
	$(VICE_TARGET) $(CURRDIR)/hforth.d64
