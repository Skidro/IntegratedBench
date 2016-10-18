RUNS=250

# Setup palloc allocation balance
echo 2 > /sys/kernel/debug/palloc/debug_level
echo 28 > /sys/kernel/debug/palloc/alloc_balance
echo "reset" > /sys/kernel/debug/palloc/control
echo 2 > /sys/kernel/debug/palloc/use_palloc

# 25% Utilization
until [ $RUNS -lt 1 ]; do
	echo ">> Run [25] : $RUNS"
	echo "build2" > /sys/kernel/debug/palloc/control
	perf stat -e r50,r52 -o /tmp/TG/BW/UN/UN/PF/00/25/$RUNS ./bandwidth -c 0 -m 384 -i 10000 -t 1000 -p -19 1> /tmp/TG/BW/UN/UN/CL/00/25/$RUNS 2> /dev/null
	echo "flush" > /sys/kernel/debug/palloc/control
	let RUNS-=1
done

echo 0 > /sys/kernel/debug/palloc/use_palloc
cat /sys/kernel/debug/palloc/control &> /tmp/TG/BW/UN/UN/average25.log
echo "reset" > /sys/kernel/debug/palloc/control
tar -cvzf /home/wali/sandbox/bw_25.tar.gz /tmp/TG

RUNS=250
echo 2 > /sys/kernel/debug/palloc/use_palloc
# 37% Utilization
until [ $RUNS -lt 1 ]; do
	echo ">> Run [37] : $RUNS"
	echo "build2" > /sys/kernel/debug/palloc/control
	perf stat -e r50,r52 -o /tmp/TG/BW/UN/UN/PF/00/37/$RUNS ./bandwidth -c 0 -m 566 -i 10000 -t 1000 -p -19 1> /tmp/TG/BW/UN/UN/CL/00/37/$RUNS 2> /dev/null
	echo "flush" > /sys/kernel/debug/palloc/control
	let RUNS-=1
done

echo 0 > /sys/kernel/debug/palloc/use_palloc
cat /sys/kernel/debug/palloc/control &> /tmp/TG/BW/UN/UN/average37.log
echo "reset" > /sys/kernel/debug/palloc/control
tar -cvzf /home/wali/sandbox/bw_37.tar.gz /tmp/TG
rm -f /home/wali/sandbox/bw_25.tar.gz

RUNS=250
echo 2 > /sys/kernel/debug/palloc/use_palloc
# 50% Utilization
until [ $RUNS -lt 1 ]; do
	echo ">> Run [50] : $RUNS"
	echo "build2" > /sys/kernel/debug/palloc/control
	perf stat -e r50,r52 -o /tmp/TG/BW/UN/UN/PF/00/50/$RUNS ./bandwidth -c 0 -m 700 -i 10000 -t 1000 -p -19 1> /tmp/TG/BW/UN/UN/CL/00/50/$RUNS 2> /dev/null
	echo "flush" > /sys/kernel/debug/palloc/control
	let RUNS-=1
done

echo 0 > /sys/kernel/debug/palloc/use_palloc
cat /sys/kernel/debug/palloc/control &> /tmp/TG/BW/UN/UN/average50.log
echo "reset" > /sys/kernel/debug/palloc/control
tar -cvzf /home/wali/sandbox/bw_50.tar.gz /tmp/TG
rm -f /home/wali/sandbox/bw_37.tar.gz

RUNS=250
echo 2 > /sys/kernel/debug/palloc/use_palloc
# 63% Utilization
until [ $RUNS -lt 1 ]; do
	echo ">> Run [63] : $RUNS"
	echo "build2" > /sys/kernel/debug/palloc/control
	perf stat -e r50,r52 -o /tmp/TG/BW/UN/UN/PF/00/63/$RUNS ./bandwidth -c 0 -m 882 -i 10000 -t 1000 -p -19 1> /tmp/TG/BW/UN/UN/CL/00/63/$RUNS 2> /dev/null
	echo "flush" > /sys/kernel/debug/palloc/control
	let RUNS-=1
done

echo 0 > /sys/kernel/debug/palloc/use_palloc
cat /sys/kernel/debug/palloc/control &> /tmp/TG/BW/UN/UN/average63.log
echo "reset" > /sys/kernel/debug/palloc/control
tar -cvzf /home/wali/sandbox/bw_63.tar.gz /tmp/TG
rm -f /home/wali/sandbox/bw_50.tar.gz

RUNS=250
echo 2 > /sys/kernel/debug/palloc/use_palloc
# 75% Utilization
until [ $RUNS -lt 1 ]; do
	echo ">> Run [75] : $RUNS"
	echo "build2" > /sys/kernel/debug/palloc/control
	perf stat -e r50,r52 -o /tmp/TG/BW/UN/UN/PF/00/75/$RUNS ./bandwidth -c 0 -m 1084 -i 10000 -t 1000 -p -19 1> /tmp/TG/BW/UN/UN/CL/00/75/$RUNS 2> /dev/null
	echo "flush" > /sys/kernel/debug/palloc/control
	let RUNS-=1
done

echo 0 > /sys/kernel/debug/palloc/use_palloc
cat /sys/kernel/debug/palloc/control &> /tmp/TG/BW/UN/UN/average75.log
echo "reset" > /sys/kernel/debug/palloc/control
tar -cvzf /home/wali/sandbox/bw_75.tar.gz /tmp/TG
rm -f /home/wali/sandbox/bw_63.tar.gz

RUNS=250
echo 2 > /sys/kernel/debug/palloc/use_palloc
# 87% Utilization
until [ $RUNS -lt 1 ]; do
	echo ">> Run [87] : $RUNS"
	echo "build2" > /sys/kernel/debug/palloc/control
	perf stat -e r50,r52 -o /tmp/TG/BW/UN/UN/PF/00/87/$RUNS ./bandwidth -c 0 -m 1218 -i 10000 -t 1000 -p -19 1> /tmp/TG/BW/UN/UN/CL/00/87/$RUNS 2> /dev/null
	echo "flush" > /sys/kernel/debug/palloc/control
	let RUNS-=1
done

echo 0 > /sys/kernel/debug/palloc/use_palloc
cat /sys/kernel/debug/palloc/control &> /tmp/TG/BW/UN/UN/average87.log
echo "reset" > /sys/kernel/debug/palloc/control
tar -cvzf /home/wali/sandbox/bw_87.tar.gz /tmp/TG
rm -f /home/wali/sandbox/bw_75.tar.gz

RUNS=250
echo 2 > /sys/kernel/debug/palloc/use_palloc
# 100% Utilization
until [ $RUNS -lt 1 ]; do
	echo ">> Run [100] : $RUNS"
	echo "build2" > /sys/kernel/debug/palloc/control
	perf stat -e r50,r52 -o /tmp/TG/BW/UN/UN/PF/00/100/$RUNS ./bandwidth -c 0 -m 1400 -i 10000 -t 1000 -p -19 1> /tmp/TG/BW/UN/UN/CL/00/100/$RUNS 2> /dev/null
	echo "flush" > /sys/kernel/debug/palloc/control
	let RUNS-=1
done

echo 0 > /sys/kernel/debug/palloc/use_palloc
cat /sys/kernel/debug/palloc/control &> /tmp/TG/BW/UN/UN/average100.log
echo "reset" > /sys/kernel/debug/palloc/control
tar -cvzf /home/wali/sandbox/bw_100.tar.gz /tmp/TG
rm -f /home/wali/sandbox/bw_87.tar.gz
