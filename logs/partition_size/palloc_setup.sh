setup () {
	debugfs_palloc_dir="/sys/kernel/debug/palloc"
	cgroup_palloc_dir="/sys/fs/cgroup/palloc"

	echo "flush" > ${debugfs_palloc_dir}/control
	echo 0x38000 > ${debugfs_palloc_dir}/palloc_mask
	mkdir ${cgroup_palloc_dir}/part1
	echo 0 > ${cgroup_palloc_dir}/part1/palloc.bins
	echo 1 > ${debugfs_palloc_dir}/use_palloc
}

setup
