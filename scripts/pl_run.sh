RUNS=250
WS=2048
echo "flush" > /sys/kernel/debug/palloc/control
echo "reset" > /sys/kernel/debug/palloc/control
echo 1 > /sys/kernel/debug/palloc/use_palloc

until [ $RUNS -lt 1 ]; do
	echo ">> Run : $RUNS"
	perf stat -e r50,r52 ./bandwidth -c 0 -m $WS -i 10 -t 1000 -p -19 1> /dev/null 2> /dev/null
	let RUNS-=1
done

cat /sys/kernel/debug/palloc/control >> data/rr.log
echo 0 > /sys/kernel/debug/palloc/use_palloc
echo "reset" > /sys/kernel/debug/palloc/control
