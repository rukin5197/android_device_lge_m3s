if /system/xbin/ls /proc/last_kmsg ; then
# Will be updated for more last_kmsgs
    /system/xbin/cat /proc/last_kmsg > /data/dontpanic/last_kmsg
fi
