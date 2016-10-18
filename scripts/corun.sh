CORES=3

# Kick off the co-runners
until [ $CORES -lt 1 ]; do
	./bandwidth -c $CORES -t 100000 -m 16384 &
	let CORES-=1
done
