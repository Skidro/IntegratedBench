echo "disable cpuquiet"
echo 0 >  /sys/devices/system/cpu/cpuquiet/tegra_cpuquiet/enable

echo "set max cpu perf."
for f in /sys/devices/system/cpu/cpu?; do 
	echo "performance" > $f/cpufreq/scaling_governor
	#echo 1 > $f/online
	#echo "ondemand" > $f/cpufreq/scaling_governor
done

echo "set max emc clock"
echo 924000000 > /sys/kernel/debug/clock/override.emc/rate
echo 1 > /sys/kernel/debug/clock/override.emc/state

echo "set max gpu clock"
echo 852000000 > /sys/kernel/debug/clock/override.gbus/rate
echo 1 > /sys/kernel/debug/clock/override.gbus/state

# Disable L2 prefetcher
insmod ~/IsolBench/IsolBench/modules/L2PrefetchControl/l2-prefetch-control.ko

# Stop lightdm service
service lightdm stop

# Setup page coloring
echo 0x00003000 > /sys/kernel/debug/palloc/palloc_mask
mount -t cgroup xxx /sys/fs/cgroup
mkdir /sys/fs/cgroup/part1
echo 0 > /sys/fs/cgroup/part1/cpuset.cpus
echo 0 > /sys/fs/cgroup/part1/cpuset.mems
echo 0 > /sys/fs/cgroup/part1/palloc.bins
echo 0 > /sys/kernel/debug/palloc/use_palloc
