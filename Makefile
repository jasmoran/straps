COMPSRC = src/language/v10.v10

dev_build:
	bin/straps $(COMPSRC) bin/straps_dev

accept: dev_test
	ifndef VER
	$(error VER is not set)
	endif
	bin/straps $(COMPSRC) versions/straps_$(VER)
	rm bin/straps
	ln -s $(pwd)versions/straps_$(VER) bin/straps
	git add versions/straps_$(VER)

dev_test: dev_build
	bin/straps_dev $(COMPSRC) bin/test1
	bin/test1 $(COMPSRC) bin/test2
	cmp bin/test1 bin/test2
	bin/test2 $(COMPSRC) bin/test3
	cmp bin/test2 bin/test3
	rm bin/test1 bin/test2 bin/test3
