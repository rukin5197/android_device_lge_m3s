

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
BOARD_SYSTEMIMAGE_PARTITION_SIZE	:= 377487360
BOARD_USERDATAIMAGE_PARTITION_SIZE	:= 947912704
BOARD_FLASH_BLOCK_SIZE			:= 262144

# userimages use ext4
TARGET_USERIMAGES_USE_EXT4		:= true
BOARD_HAS_NO_MISC_PARTITION		:= true

# vold stuff
BOARD_VOLD_MAX_PARTITIONS		:= 24
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR	:= true
# no clue what this does, but we have the file to support it, so lets try it out
BOARD_USE_USB_MASS_STORAGE_SWITCH	:= true

TARGET_NO_BOOT				:= false
TARGET_NO_RECOVERY			:= false

# Recovery
TARGET_PREBUILT_KERNEL			:= device/lge/m3s/kernel
TARGET_PREBUILT_RECOVERY_KERNEL		:= device/lge/m3s/recovery_kernel
#TARGET_KERNEL_CONFIG			:= lge_m3s-perf_defconfig
#TARGET_KERNEL_SOURCE			:= kernel/lge/vm696-pernel
TARGET_RECOVERY_INITRC			:= device/lge/m3s/recovery/init.rc
BOARD_CUSTOM_GRAPHICS			:= ../../../device/lge/m3s/recovery/graphics.c


# Audio, Bluetooth, camera
#BUILD_OLD_LIBCAMERA			:= true
USE_CAMERA_STUB				:= true
#TARGET_PROVIDES_LIBAUDIO		:= true
#BOARD_USES_AUDIO_LEGACY			:= false
BOARD_HAVE_BLUETOOTH			:= true
BOARD_HAVE_BLUETOOTH_BCM		:= true
BOARD_USE_CAF_LIBCAMERA			:= true
BOARD_CAMERA_USE_GETBUFFERINFO		:= true

# RIL
#BOARD_PROVIDES_LIBRIL			:= true
#TARGET_PROVIDES_LIBRIL			:= device/lge/m3s/prebuilt/lib/libril.so

# QCOM Stuff

# used all up in the jni
USE_OPENGL_RENDERER			:= true
# I don't see this one used for cm7
BOARD_USES_QCOM_HARDWARE		:= true
# this is apparently used for hardware/qcom/media in cm7, but not in cm9?
BOARD_USES_QCOM_LIBS			:= true
# used for some HDMI stuff in libhwcomposer
TARGET_USES_OVERLAY			:= false
# used to decide between 2 or 3 buffers in libsurfaceflinger
TARGET_HAVE_BYPASS			:= false
# used in libcopybit makefile.  our stock one uses cd2
TARGET_USES_C2D_COMPOSITION		:= true
# kernel should create "/dev/genlock" to use this
TARGET_USES_GENLOCK			:= false

TARGET_QCOM_HDMI_OUT			:= false
BOARD_EGL_CFG				:= device/lge/m3s/egl.cfg

# it looks like cm7 only uses these two when building non-msm7x30 stuff?
TARGET_GRALLOC_USES_ASHMEM		:= true
BOARD_USE_QCOM_PMEM			:= true

BOARD_USES_QCOM_LIBRPC			:= true






# wifi stuff
BOARD_WPA_SUPPLICANT_DRIVER		:= WEXT
# stock wpa_supplicant is version 0.8, but cm7 only has 0.5 and 0.6
WPA_SUPPLICANT_VERSION			:= VER_0_6_X
BOARD_WLAN_DEVICE			:= wlan0
# qualcomm's wifi.c uses these names.  we dont need them if we're using the cm7 wifi.c
#WIFI_SDIO_IF_DRIVER_MODULE_PATH		:= "/system/lib/modules/librasdioif.ko"
#WIFI_SDIO_IF_DRIVER_MODULE_NAME		:= "librasdioif"

# module paths
WIFI_DRIVER_MODULE_PATH			:= "/system/lib/modules/wlan.ko"
WIFI_EXT_MODULE_PATH			:= /system/lib/modules/librasdioif.ko
# module names
WIFI_DRIVER_MODULE_NAME			:= "wlan"
WIFI_EXT_MODULE_NAME			:= "librasdioif"



# GPS HAL from e400.  maybe ours is the same as theirs
BOARD_USES_QCOM_LIBRPC				:= true
BOARD_USES_QCOM_GPS				:= true
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE		:= lge_m3s
# AMSS version to use for GPS
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION	:= 50000

# modified version of the ota-zipper-upper
TARGET_RELEASETOOL_OTA_FROM_TARGET_SCRIPT	:= device/lge/m3s/tools/ota_from_target_files





