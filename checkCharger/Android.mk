
ifeq ($(TARGET_BOOTLOADER_BOARD_NAME),lge_m3s)

#logic for the charging animation from our stock setup:
#
# Apparently the kernel commandline is the same in normal boot and in power-off-charging modes.  So
# init triggers for "boot-pause" never get called.
# After post-fs triggers are processed, and before queue_builtin_action( "property_service_init" ),
# init binary checks for "/proc/last_kmsg" and "/proc/first_bootmsg". if neither of those exist, it
# launches "/sbin/chargerlogo" with argv[0] = "chargerlogo"
#
# This program tries to emulate that without hacking up init.c.

LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional

LOCAL_SRC_FILES := checkchargerMode.cpp

LOCAL_MODULE := checkchargerMode

LOCAL_FORCE_STATIC_EXECUTABLE := true
LOCAL_MODULE_PATH := $(TARGET_ROOT_OUT_SBIN)
LOCAL_UNSTRIPPED_PATH := $(TARGET_ROOT_OUT_SBIN_UNSTRIPPED)

LOCAL_STATIC_LIBRARIES := libcutils libc
include $(BUILD_EXECUTABLE)

endif
