if /system/bin/ls /proc/last_kmsg ; then
# Will be updated for more last_kmsgs
    /system/bin/cat /proc/last_kmsg > /data/dontpanic/last_kmsg
fi