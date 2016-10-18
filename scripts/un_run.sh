RUNS=10
echo 2 > /sys/kernel/debug/palloc/use_palloc

until [ $RUNS -lt 1 ]; do
	echo ">> Run : $RUNS"
	echo "build2" > /sys/kernel/debug/palloc/control
	perf stat -e r50,r52 -o data/O1/UN/PF/$RUNS ./bandwidth -c 0 -m 1400 -i 10000 -t 1000 -p -19 1> data/O1/UN/CL/$RUNS 2> /dev/null
	let RUNS-=1
done

cat /sys/kernel/debug/palloc/control &> data/O1/un.log
echo 0 > /sys/kernel/debug/palloc/use_palloc
echo "reset" > /sys/kernel/debug/palloc/control
