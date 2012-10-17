

# Board configuration
#

TARGET_NO_BOOTLOADER			:= true
TARGET_BOARD_PLATFORM			:= msm7x30
TARGET_BOARD_PLATFORM_GPU		:= qcom-adreno200
TARGET_CPU_ABI				:= armeabi-v7a
TARGET_CPU_ABI2				:= armeabi
TARGET_ARCH_VARIANT			:= armv7-a-neon
ARCH_ARM_HAVE_TLS_REGISTER		:= true
TARGET_PROVIDES_INIT_RC			:= true

TARGET_GLOBAL_CFLAGS			+= -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS			+= -mfpu=neon -mfloat-abi=softfp

TARGET_BOOTLOADER_BOARD_NAME		:= lge_m3s




# boot.img stuff
BOARD_KERNEL_CMDLINE			:= androidboot.hardware=qcom
BOARD_KERNEL_BASE			:= 200000
BOARD_FORCE_RAMDISK_ADDRESS		:= 1300000
BOARD_KERNEL_PAGESIZE			:= 4096


# partition info
BOARD_BOOTIMAGE_PARTITION_SIZE		:= 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE	:= 8388608
BOARD_SYSTEMIMAGE_PARTITION_SIZE	:= 947912704
BOARD_USERDATAIMAGE_PARTITION_SIZE	:= 377487360
BOARD_FLASH_BLOCK_SIZE			:= 262144

# userimages use ext4
TARGET_USERIMAGES_USE_EXT4		:= true
BOARD_HAS_NO_MISC_PARTITION		:= true

BOARD_DATA_DEVICE			:= /dev/block/mmcblk0p13
BOARD_DATA_FILESYSTEM			:= ext4
BOARD_DATA_FILESYSTEM_OPTIONS		:= nosuid,nodev,relatime,resuid=1000,barrier=1,data=ordered,noauto_da_alloc

BOARD_SYSTEM_DEVICE			:= /dev/block/mmcblk0p12
BOARD_SYSTEM_FILESYSTEM			:= ext4
BOARD_SYSTEM_FILESYSTEM_OPTIONS		:= relatime,barrier=1,data=ordered

BOARD_CACHE_DEVICE			:= /dev/block/mmcblk0p6
BOARD_CACHE_FILESYSTEM			:= ext4
BOARD_CACHE_FILESYSTEM_OPTIONS		:= nosuid,nodev,relatime,barrier=1,data=ordered

BOARD_VOLD_MAX_PARTITIONS		:= 22
#BOARD_VOLD_EMMC_SHARES_DEV_MAJOR	:= true

TARGET_NO_BOOT				:= false
TARGET_NO_RECOVERY			:= false

# Recovery
TARGET_PREBUILT_KERNEL			:= device/lge/m3s/kernel
TARGET_PREBUILT_RECOVERY_KERNEL		:= device/lge/m3s/recovery_kernel
TARGET_RECOVERY_INITRC			:= device/lge/m3s/recovery/init.rc
BOARD_CUSTOM_GRAPHICS			:= ../../../device/lge/m3s/recovery/graphics.c
#BOARD_CUSTOM_RECOVERY_KEYMAPPING


# Audio, Bluetooth, camera
#BUILD_OLD_LIBCAMERA			:= true
USE_CAMERA_STUB				:= true
#TARGET_PROVIDES_LIBAUDIO		:= true
#BOARD_USES_AUDIO_LEGACY			:= false
#BOARD_COMBO_DEVICE_SUPPORTED		:= true
BOARD_HAVE_BLUETOOTH			:= true
#BOARD_HAVE_BLUETOOTH_BCM		:= true
#BOARD_USE_CAF_LIBCAMERA			:= true

# RIL
#BOARD_PROVIDES_LIBRIL			:= true
#TARGET_PROVIDES_LIBRIL			:= device/lge/m3s/prebuilt/lib/libril.so

# QCOM Stuff
BOARD_USES_QCOM_HARDWARE		:= true
BOARD_USES_QCOM_LIBS			:= true
BOARD_USE_QCOM_PMEM			:= true
TARGET_USES_OVERLAY			:= false
TARGET_HAVE_BYPASS			:= false
TARGET_USES_C2D_COMPOSITION		:= true
TARGET_USES_GENLOCK			:= false
TARGET_QCOM_HDMI_OUT			:= false
TARGET_FORCE_CPU_UPLOAD			:= true
BOARD_EGL_CFG				:= device/lge/m3s/egl.cfg

USE_OPENGL_RENDERER			:= true	    # used all up in the jni
BOARD_USES_QCOM_HARDWARE		:= true	    # I don't see this one used for cm7
BOARD_USES_QCOM_LIBS			:= true	    # this is apparently used for hardware/qcom/media in cm7, but not in cm9?
TARGET_USES_OVERLAY			:= false    # used for some HDMI stuff in libhwcomposer
TARGET_HAVE_BYPASS			:= false    # used to decide between 2 or 3 buffers in libsurfaceflinger
TARGET_USES_C2D_COMPOSITION		:= true	    # used in libcopybit makefile.  our stock one uses cd2
#TARGET_USES_GENLOCK			:= true	    # kernel should create "/dev/genlock" to use this
TARGET_QCOM_HDMI_OUT			:= false
BOARD_EGL_CFG				:= device/lge/m3s/egl.cfg

# it looks like cm7 only uses these two when building non-msm7x30 stuff?
TARGET_GRALLOC_USES_ASHMEM		:= true
BOARD_USE_QCOM_PMEM			:= true	    # we have a /dev/pmem, so lets use this

# lge e400 has the same wifi setup as us, so lets try their config
BOARD_WLAN_DEVICE			:= qcwcn
WIFI_EXT_MODULE_PATH			:= /system/lib/modules/librasdioif.ko
WIFI_DRIVER_MODULE_PATH			:= /system/lib/modules/wlan.ko
WIFI_EXT_MODULE_NAME			:= librasdioif
WIFI_DRIVER_MODULE_NAME			:= wlan
#BOARD_WPA_SUPPLICANT_PRIVATE_LIB	:= lib_driver_cmd_wext
BOARD_WPA_SUPPLICANT_DRIVER		:= WEXT
WPA_SUPPLICANT_VERSION			:= VER_0_6_X
BOARD_WEXT_NO_COMBO_SCAN		:= true

# GPS HAL from e400.  maybe ours is the same as theirs
BOARD_USES_QCOM_LIBRPC				:= true
BOARD_USES_QCOM_GPS				:= true
#BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE		:= e400
# AMSS version to use for GPS
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION	:= 50000

COMMON_GLOBAL_CFLAGS				+= -DBOARD_CHARGING_CMDLINE_NAME='"lge.reboot"' -DBOARD_CHARGING_CMDLINE_VALUE='"pwroff"'








#TARGET_USE_SCORPION_BIONIC_OPTIMIZATION := true
#TARGET_USE_SCORPION_PLD_SET		:= true
#TARGET_SCORPION_BIONIC_PLDOFFS		:= 6
#TARGET_SCORPION_BIONIC_PLDSIZE		:= 128

# HWComposer
#BOARD_USES_HWCOMPOSER			:= true



