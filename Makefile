templates = $(wildcard src/*.sol.in)
generated = $(templates:%.sol.in=%.gen.sol)
sources = $(wildcard src/*) $(generated)
all: $(sources); dapp --use solc:0.5.12 build
test: all; DAPP_SKIP_BUILD=1 dapp --use solc:0.5.12 test
%.gen.sol: %.sol.in $(sources) $(wildcard out/*)
	dapp --use solc:0.5.12 build; rm -rf $@
	if $< >$@; then chmod -w $@; else rm $@; exit 1; fi
