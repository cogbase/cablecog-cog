ABSPATH=perl -MCwd -e "print Cwd::abs_path shift"
SRC_DIR=$(shell $(ABSPATH) ../..)
COG=$(SRC_DIR)/cog-pm/bin/cog

SPIDERCOG=$(SRC_DIR)/app-spidercog-pm/lib
COGLIB=$(SRC_DIR)/cog-pm/lib
PROXYMAP=$(SRC_DIR)/plack-middleware-proxymap-pm/lib
CACHE=$(SRC_DIR)/plack-middleware-cache-pm/lib

export PERL5LIB=$(SPIDERCOG):$(COGLIB):$(PROXYMAP):$(CACHE)
export PERL5OPT=-Mdiagnostics

test: clean up

up: update make start

update make clean purge:
	$(COG) $@

start:
	$(COG) $@ -s Starman

init:
	$(COG) $@ --app=App::SpiderCog
