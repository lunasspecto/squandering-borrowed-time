SHELL = /bin/sh
.SUFFIXES:
.SUFFIXES: .h .inf .sparse .iFiction .jpg .z5

all: clean squandering.z5 blorb

squandering.z5:
	inform -v5 squandering.inf

blorb: squandering.z5 iFiction
	babel -blorbs squandering.z5 *.iFiction cover.jpg

iFiction: squandering.z5
	babel -complete squandering.z5 iFiction.sparse

debug:
	inform -Xv5 squandering.inf

economy:
	inform -ev5~S squandering.inf

source-dist:
	rm -rf squandering
	mkdir squandering
	tar -c Makefile cover.jpg iFiction.sparse *.h *.inf | tar -C squandering -x
	7z u -t7z -m0=lzma -mx=9 -mfb=64 -md=32m -ms=on squandering.7z squandering
	rm -rf squandering

clean:
	rm -f *.z5 *.zblorb *.iFiction
