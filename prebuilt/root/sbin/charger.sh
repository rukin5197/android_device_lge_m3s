#!/system/bin/sh
#
#logic for the charging animation from our stock setup:
#
# Apparently the kernel commandline is the same in normal boot and in power-off-charging modes.  So
# init triggers for "boot-pause" never get called.
# After post-fs triggers are processed, and before queue_builtin_action( "property_service_init" ),
#init binary checks for "/proc/last_kmsg" and "/proc/first_bootmsg". if neither of those exist, it
#launches "/sbin/chargerlogo" with argv[0] = "chargerlogo"
#
# This scrpit tries to emulate that without hacking up init.c.

if /system/bin/ls /proc/first_bootmsg ; then
    exit 0
fi

if /system/bin/ls /proc/last_kmsg ; then
    exit 0
fi

/sbin/chargerlogo
