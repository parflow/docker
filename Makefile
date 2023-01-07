
default:
	./bin/parflow.sh default_single.tcl 1 1 1

clean:
	rm -f default_single.out.*
	rm -fr default_single.out
	rm -f default_single.pfidb
