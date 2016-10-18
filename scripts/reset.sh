echo 1 > /sys/kernel/debug/palloc/debug_level
echo 0 > /sys/kernel/debug/palloc/use_palloc
echo "reset" > /sys/kernel/debug/palloc/control
echo "flush" > /sys/kernel/debug/palloc/control
echo "build2" > /sys/kernel/debug/palloc/control
