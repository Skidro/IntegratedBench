results_dir=logs/palloc4
partition_size=512
multipliers=(0.25 0.5 0.75 1 1.25 1.5 2 4 8 16)

RED='\033[0;31m'
GRN='\033[0;32m'
YLW='\033[0;33m'
CYN='\033[0;36m'
NCL='\033[0m'

run () {
	cpu=$1
	duration=$2
	iterations=$3
	working_set=$4

	perf stat -e r16,r17 -o ${results_dir}/w${working_set}kb.perf \
		./bandwidth -c ${cpu} -t ${duration} -i ${iterations} \
		-m ${working_set} &
	echo $! > /sys/fs/cgroup/palloc/part1/tasks
	wait $!
}

mkdir -p ${results_dir}
for m in ${multipliers[@]}; do
	ws=`bc <<< "${partition_size} * ${m}"`

	echo -e "${GRN}[STATUS] Profiling working-set: ${ws%.*}${NCL}"
	run 3 100 100000 ${ws%.*}
	./bandwidth -c 3 -t 2 -m 16384 &> /dev/null
done
