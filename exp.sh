results_dir=logs/palloc_bits
working_set_size=`bc <<< "256*1.25"`
corunner_bins=(0 1 2 3 4 5 6 7)

RED='\033[0;31m'
GRN='\033[0;32m'
YLW='\033[0;33m'
CYN='\033[0;36m'
NCL='\033[0m'

corun () {
	bin=$1
	cpu=$2

	echo ${bin} > /sys/fs/cgroup/palloc/part2/palloc.bins
	./bandwidth -c ${cpu} -t 1000 -m ${working_set_size} &> /dev/null &
	echo $! > /sys/fs/cgroup/palloc/part2/tasks
}

run () {
	cpu=$1
	duration=$2
	iterations=$3
	bin=$4

	perf stat -e r16,r17 -o ${results_dir}/b${bin}.perf \
		./bandwidth -c ${cpu} -t ${duration} -i ${iterations} \
		-m ${working_set_size} &
	echo $! > /sys/fs/cgroup/palloc/part1/tasks
	wait $!
}

mkdir -p ${results_dir}
for b in ${corunner_bins[@]}; do
	echo -e "${GRN}[STATUS] Profiling bin: 0 / ${b}${NCL}"
	corun 4 ${b}
	sleep 1
	run 3 100 100000 ${b}
	killall bandwidth &> /dev/null

	./bandwidth -c 3 -t 2 -m 16384 &> /dev/null
done
