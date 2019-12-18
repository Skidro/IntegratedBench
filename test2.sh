perf stat -e r16,r17,r18 ./bandwidth -c 4 -t 5 -m 1200 &
echo $! > /sys/fs/cgroup/palloc/part2/tasks
