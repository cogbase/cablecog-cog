ABSPATH=perl -MCwd -e "print Cwd::abs_path shift"
SRC_DIR=$(shell $(ABSPATH) $(HOME)/src)
COG=$(SRC_DIR)/cog-pm/bin/cog

SPIDERCOG=$(SRC_DIR)/app-spidercog-pm/lib
CABLECOG=$(SRC_DIR)/app-cablecog-pm/lib
COGLIB=$(SRC_DIR)/cog-pm/lib
PROXYMAP=$(SRC_DIR)/plack-middleware-proxymap-pm/lib
CACHE=$(SRC_DIR)/plack-middleware-cache-pm/lib

export PERL5LIB=$(SPIDERCOG):$(CABLECOG):$(COGLIB):$(PROXYMAP):$(CACHE)
export PERL5OPT=-Mdiagnostics

test: clean up

up: update make start

update make clean purge:
	$(COG) $@

start:
	$(COG) $@ -s Starman

init:
	$(COG) $@ --app=App::CableCog

perl5lib:
	@echo export PERL5LIB=$(PERL5LIB)
