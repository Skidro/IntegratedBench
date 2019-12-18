debugfs_palloc_dir="/sys/kernel/debug/palloc"
cgroup_palloc_dir="/sys/fs/cgroup/palloc"

setup () {
	echo "flush" > ${debugfs_palloc_dir}/control
	echo 0x18000 > ${debugfs_palloc_dir}/palloc_mask

	[ -d "${cgroup_palloc_dir}/part1" ] || mkdir ${cgroup_palloc_dir}/part1
	[ -d "${cgroup_palloc_dir}/part2" ] || mkdir ${cgroup_palloc_dir}/part2

	echo 0 > ${cgroup_palloc_dir}/part1/palloc.bins
	echo 1 > ${cgroup_palloc_dir}/part2/palloc.bins

	echo 1 > ${debugfs_palloc_dir}/use_palloc
}

setup
