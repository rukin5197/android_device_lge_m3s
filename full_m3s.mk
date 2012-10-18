
$(call inherit-product, build/target/product/full.mk)

## Specify phone tech before including full_phone
#$(call inherit-product, vendor/cyanogen/config/cdma.mk)

#theres no CMDA stuff, so go with the gsm for now until we know we dont need it
#$(call inherit-product-if-exists, vendor/cyanogen/products/gsm.mk)

# Inherit some common CM stuff.
# dont bother building themes until we can actually get it to boot
$(call inherit-product, vendor/cyanogen/products/common_full.mk)

# languages
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)


#
# Setup device specific product configuration.
#

# Overrides
PRODUCT_NAME			    := full_m3s
PRODUCT_DEVICE			    := m3s
PRODUCT_BRAND			    := lge
PRODUCT_MODEL			    := LG-VM696

# Release name and versioning
PRODUCT_RELEASE_NAME		    := LG Optimus Elite
PRODUCT_VERSION_DEVICE_SPECIFIC	    := VM696ZV5

TARGET_OTA_ASSERT_DEVICE	    := m3s_virgin_us


# try to reproduce the stock prop file.  we can't override the `date` command, so leave the dates alone.
# we also cant reproduce the user and hostname
PRODUCT_BUILD_PROP_OVERRIDES +=									\
	TARGET_PRODUCT=m3s_virgin_us								\
	PRODUCT_DEVICE=m3s									\
	TARGET_BUILD_VARIANT=user								\
	BUILD_ID=ZV5.GWK74									\
	BUILD_DISPLAY_ID=ZV5.GWK74								\
	BUILD_NUMBER=47E5087D									\
	TARGET_BUILD_TYPE=user									\
	BUILD_VERSION_TAGS=release-keys								\
	PRODUCT_NAME=m3s_virgin_us								\
	TARGET_BOOTLOADER_BOARD_NAME=lge_m3s							\
	PRODUCT_MANUFACTURER=LGE								\
	PRODUCT_DEFAULT_LANGUAGE=en								\
	PRODUCT_DEFAULT_REGION=US								\
	BUILD_FINGERPRINT="lge/m3s_virgin_us/m3s:2.3.7/ZV5.GWK74/47E5087D:user/release-keys"	\
	PRIVATE_BUILD_DESC="m3s_virgin_us-user 2.3.7 ZV5.GWK74 47E5087D release-keys"


#	TARGET_BOARD_PLATFORM=msm7k								\

#PRODUCT_PROPERTY_OVERRIDES +=

ADDITIONAL_BUILD_PROPERTIES +=					\
    ro.com.google.clientidbase=android-lge			\
    ro.com.google.clientidbase.yt=android-virgin-us		\
    ro.com.google.clientidbase.am=android-virgin-us		\
    ro.com.google.clientidbase.gmm=android-lge			\
    ro.com.google.clientidbase.ms=android-virgin-us

# adb on by default so we can wipe /data and still get logcat and dmesg crap
ADDITIONAL_BUILD_PROPERTIES +=					\
    persist.service.adb.enable=1

# Stock setup has dalvik-cache only on /data.  This keeps it that way, but do we really want to do that?
PRODUCT_PROPERTY_OVERRIDES +=					\
    dalvik.vm.dexopt-data-only=1

# Enable Torch
#PRODUCT_PACKAGES += Torch

# we need to somehow remove rom manager because it does nothing but brick this model of phone
#PRODUCT_COPY_FILES := $(filter-out "vendor/cyanogen/proprietary/RomManager.apk:system/app/RomManager.apk",$(PRODUCT_COPY_FILES))

# Kernel Modules
$(call inherit-product-if-exists, $(LOCAL_PATH)/prebuilt/modules/modules.mk)

DEVICE_PACKAGE_OVERLAYS += device/lge/$(PRODUCT_DEVICE)/overlay


ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/lge/$(PRODUCT_DEVICE)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

PRODUCT_AAPT_CONFIG		    := normal mdpi
PRODUCT_AAPT_PREF_CONFIG	    := mdpi


# Packages
# these are packages that are present in our stock (2.3.7) rom and it looks like the build system knows how to make them
PRODUCT_PACKAGES +=			\
    gralloc.default			\
    gralloc.msm7x30			\
    lights.msm7x30			\
    overlay.default			\
    libstagefright			\
    libstagefright_amrnb_common		\
    libstagefright_avc_common		\
    libstagefright_color_conversion	\
    libstagefright_enc_common		\
    libstagefright_foundation		\
    libstagefrighthw			\
    libstagefright_omx			\
    libOmxCore				\
    libOmxAacEnc			\
    libOmxEvrcEnc			\
    libOmxQcelp13Enc			\
    libOmxVdec				\
    libOmxVenc				\
    libmm-omxcore			\
    libdivxdrmdecrypt			\
    libhardware_legacy			\
    com.android.future.usb.accessory

PRODUCT_PACKAGES +=			\
    gps.$(TARGET_BOOTLOADER_BOARD_NAME)

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml

# boot animation
PRODUCT_COPY_FILES += \
    vendor/cyanogen/prebuilt/mdpi/media/bootanimation.zip:system/media/bootanimation.zip

# use high-density artwork where available
PRODUCT_LOCALES += mdpi

# SDCard
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/vold.fstab:system/etc/vold.fstab

# Keychar & Keylayout
PRODUCT_COPY_FILES +=											\
    $(LOCAL_PATH)/keychars/atcmd_virtual_kbd.kcm.bin:system/usr/keychars/atcmd_virtual_kbd.kcm.bin	\
    $(LOCAL_PATH)/keychars/ats_input.kcm.bin:system/usr/keychars/ats_input.kcm.bin			\
    $(LOCAL_PATH)/keychars/lge_m3s_keypad.kcm.bin:system/usr/keychars/lge_m3s_keypad.kcm.bin		\
    $(LOCAL_PATH)/keychars/qwerty.kcm.bin:system/usr/keychars/qwerty.kcm.bin				\
    $(LOCAL_PATH)/keychars/qwerty2.kcm.bin:system/usr/keychars/qwerty2.kcm.bin				\
    $(LOCAL_PATH)/keylayout/7k_handset.kl:system/usr/keylayout/7k_handset.kl				\
    $(LOCAL_PATH)/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl					\
    $(LOCAL_PATH)/keylayout/atcmd_virtual_kbd.kl:system/usr/keylayout/atcmd_virtual_kbd.kl		\
    $(LOCAL_PATH)/keylayout/ats_input.kl:system/usr/keylayout/ats_input.kl				\
    $(LOCAL_PATH)/keylayout/gpio-side-keypad.kl:system/usr/keylayout/gpio-side-keypad.kl		\
    $(LOCAL_PATH)/keylayout/lge_m3s_keypad.kl:system/usr/keylayout/lge_m3s_keypad.kl			\
    $(LOCAL_PATH)/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl					\
    $(LOCAL_PATH)/keylayout/touch_mcs8000.kl:system/usr/keylayout/touch_mcs8000.kl

# Input device calibration files
# these don't exist in the stock rom, but these look like good enough values to use
PRODUCT_COPY_FILES +=										\
    $(LOCAL_PATH)/prebuilt/usr/idc/atcmd_virtual_kbd.idc:system/usr/idc/atcmd_virtual_kbd.idc	\
    $(LOCAL_PATH)/prebuilt/usr/idc/gpio-side-keypad.idc:system/usr/idc/gpio-side-keypad.idc	\
    $(LOCAL_PATH)/prebuilt/usr/idc/touch_mcs8000.idc:system/usr/idc/touch_mcs8000.idc		\
    $(LOCAL_PATH)/prebuilt/usr/idc/gpio-side-keypad.idc:system/usr/idc/gpio-side-keypad.idc

# TODO-
# maybe push the /etc/sensor calibration files

# Common Qualcomm scripts
PRODUCT_COPY_FILES +=										    \
    $(LOCAL_PATH)/prebuilt/etc/init.qcom.sdio.sh:system/etc/init.qcom.sdio.sh			    \
    $(LOCAL_PATH)/prebuilt/etc/format_fat32.sh:system/etc/format_fat32.sh			    \
    $(LOCAL_PATH)/prebuilt/etc/format_first.sh:system/etc/format_first.sh			    \
    $(LOCAL_PATH)/prebuilt/etc/init.qcom.bt.sh:system/etc/init.qcom.bt.sh			    \
    $(LOCAL_PATH)/prebuilt/etc/init.qcom.coex.sh:system/etc/init.qcom.coex.sh			    \
    $(LOCAL_PATH)/prebuilt/etc/init.qcom.fm.sh:system/etc/init.qcom.fm.sh			    \
    $(LOCAL_PATH)/prebuilt/etc/init.qcom.ftm_module.sh:system/etc/init.qcom.ftm_module.sh	    \
    $(LOCAL_PATH)/prebuilt/etc/init.qcom.ftm_module_out.sh:system/etc/init.qcom.ftm_module_out.sh   \
    $(LOCAL_PATH)/prebuilt/etc/init.qcom.post_boot.sh:system/etc/init.qcom.post_boot.sh		    \
    $(LOCAL_PATH)/prebuilt/etc/init.qcom.sdio.sh:system/etc/init.qcom.sdio.sh			    \
    $(LOCAL_PATH)/prebuilt/etc/init.qcom.wifi.sh:system/etc/init.qcom.wifi.sh			    \
    $(LOCAL_PATH)/prebuilt/etc/last_kmsg_backup.sh:system/etc/last_kmsg_backup.sh

# configs
PRODUCT_COPY_FILES +=											\
    $(LOCAL_PATH)/prebuilt/etc/gps.conf:system/etc/gps.conf						\
    $(LOCAL_PATH)/prebuilt/lib/egl/egl.cfg:system/lib/egl/egl.cfg					\
    $(LOCAL_PATH)/prebuilt/etc/wifi/WCN1314_qcom_cfg.ini:system/etc/wifi/WCN1314_qcom_cfg.ini		\
    $(LOCAL_PATH)/prebuilt/etc/wifi/WCN1314_qcom_wlan_nv.bin:system/etc/wifi/WCN1314_qcom_wlan_nv.bin	\
    $(LOCAL_PATH)/prebuilt/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf		\
    $(LOCAL_PATH)/prebuilt/etc/OperatorPolicy.xml:system/etc/OperatorPolicy.xml				\
    $(LOCAL_PATH)/prebuilt/etc/UserPolicy.xml:system/etc/UserPolicy.xml					\
    $(LOCAL_PATH)/prebuilt/etc/apns-conf.xml:system/etc/apns-conf.xml



# firmware
PRODUCT_COPY_FILES +=														    \
    $(LOCAL_PATH)/prebuilt/etc/firmware/wlan/volans/WCN1314_cfg.dat:system/etc/firmware/wlan/volans/WCN1314_cfg.dat		    \
    $(LOCAL_PATH)/prebuilt/etc/firmware/wlan/volans/WCN1314_qcom_fw.bin:system/etc/firmware/wlan/volans/WCN1314_qcom_fw.bin	    \
    $(LOCAL_PATH)/prebuilt/etc/firmware/cyttsp_7630_fluid.hex:system/etc/firmware/cyttsp_7630_fluid.hex				    \
    $(LOCAL_PATH)/prebuilt/etc/firmware/leia_pfp_470.fw:system/etc/firmware/leia_pfp_470.fw					    \
    $(LOCAL_PATH)/prebuilt/etc/firmware/leia_pm4_470.fw:system/etc/firmware/leia_pm4_470.fw					    \
    $(LOCAL_PATH)/prebuilt/etc/firmware/vidc_720p_command_control.fw:system/etc/firmware/vidc_720p_command_control.fw		    \
    $(LOCAL_PATH)/prebuilt/etc/firmware/vidc_720p_h263_dec_mc.fw:system/etc/firmware/vidc_720p_h263_dec_mc.fw			    \
    $(LOCAL_PATH)/prebuilt/etc/firmware/vidc_720p_h264_dec_mc.fw:system/etc/firmware/vidc_720p_h264_dec_mc.fw			    \
    $(LOCAL_PATH)/prebuilt/etc/firmware/vidc_720p_h264_enc_mc.fw:system/etc/firmware/vidc_720p_h264_enc_mc.fw			    \
    $(LOCAL_PATH)/prebuilt/etc/firmware/vidc_720p_mp4_dec_mc.fw:system/etc/firmware/vidc_720p_mp4_dec_mc.fw			    \
    $(LOCAL_PATH)/prebuilt/etc/firmware/vidc_720p_mp4_enc_mc.fw:system/etc/firmware/vidc_720p_mp4_enc_mc.fw			    \
    $(LOCAL_PATH)/prebuilt/etc/firmware/vidc_720p_vc1_dec_mc.fw:system/etc/firmware/vidc_720p_vc1_dec_mc.fw			    \
    $(LOCAL_PATH)/prebuilt/etc/firmware/yamato_pfp.fw:system/etc/firmware/yamato_pfp.fw						    \
    $(LOCAL_PATH)/prebuilt/etc/firmware/yamato_pm4.fw:system/etc/firmware/yamato_pm4.fw


# stuff for boot.img ramdisk
# this list generated by running the following rommand in the prebuilt/root directory
# for i in $(find -type f | sed s:./::);do echo -e \\t\$\(LOCAL_PATH\)/prebuilt/root/$i:root/$i  \\;done
PRODUCT_COPY_FILES +=\
    $(LOCAL_PATH)/prebuilt/root/chargerimages/battery_charging_08.rle:root/chargerimages/battery_charging_08.rle \
    $(LOCAL_PATH)/prebuilt/root/chargerimages/battery_charging_02.rle:root/chargerimages/battery_charging_02.rle \
    $(LOCAL_PATH)/prebuilt/root/chargerimages/battery_ani_05.rle:root/chargerimages/battery_ani_05.rle \
    $(LOCAL_PATH)/prebuilt/root/chargerimages/battery_charging_10.rle:root/chargerimages/battery_charging_10.rle \
    $(LOCAL_PATH)/prebuilt/root/chargerimages/battery_wait_ani_02.rle:root/chargerimages/battery_wait_ani_02.rle \
    $(LOCAL_PATH)/prebuilt/root/chargerimages/battery_notenough.rle:root/chargerimages/battery_notenough.rle \
    $(LOCAL_PATH)/prebuilt/root/chargerimages/black_bg.rle:root/chargerimages/black_bg.rle \
    $(LOCAL_PATH)/prebuilt/root/chargerimages/battery_charging_09.rle:root/chargerimages/battery_charging_09.rle \
    $(LOCAL_PATH)/prebuilt/root/chargerimages/battery_charging_12.rle:root/chargerimages/battery_charging_12.rle \
    $(LOCAL_PATH)/prebuilt/root/chargerimages/battery_charging_06.rle:root/chargerimages/battery_charging_06.rle \
    $(LOCAL_PATH)/prebuilt/root/chargerimages/battery2.rle:root/chargerimages/battery2.rle \
    $(LOCAL_PATH)/prebuilt/root/chargerimages/battery_charging_07.rle:root/chargerimages/battery_charging_07.rle \
    $(LOCAL_PATH)/prebuilt/root/chargerimages/battery_charging_11.rle:root/chargerimages/battery_charging_11.rle \
    $(LOCAL_PATH)/prebuilt/root/chargerimages/battery_charging_01.rle:root/chargerimages/battery_charging_01.rle \
    $(LOCAL_PATH)/prebuilt/root/chargerimages/battery_bg.rle:root/chargerimages/battery_bg.rle \
    $(LOCAL_PATH)/prebuilt/root/chargerimages/battery_ani_03.rle:root/chargerimages/battery_ani_03.rle \
    $(LOCAL_PATH)/prebuilt/root/chargerimages/battery_charging_04.rle:root/chargerimages/battery_charging_04.rle \
    $(LOCAL_PATH)/prebuilt/root/chargerimages/battery_charging_03.rle:root/chargerimages/battery_charging_03.rle \
    $(LOCAL_PATH)/prebuilt/root/chargerimages/battery_charging_05.rle:root/chargerimages/battery_charging_05.rle \
    $(LOCAL_PATH)/prebuilt/root/chargerimages/battery_ani_04.rle:root/chargerimages/battery_ani_04.rle \
    $(LOCAL_PATH)/prebuilt/root/chargerimages/battery_charging_00.rle:root/chargerimages/battery_charging_00.rle \
    $(LOCAL_PATH)/prebuilt/root/chargerimages/battery_ani_01.rle:root/chargerimages/battery_ani_01.rle \
    $(LOCAL_PATH)/prebuilt/root/chargerimages/battery_ani_02.rle:root/chargerimages/battery_ani_02.rle \
    $(LOCAL_PATH)/prebuilt/root/chargerimages/battery_wait_ani_01.rle:root/chargerimages/battery_wait_ani_01.rle \
    $(LOCAL_PATH)/prebuilt/root/init.qcom.rc:root/init.lge.rc \
    $(LOCAL_PATH)/prebuilt/root/sbin/bootlogo:root/sbin/bootlogo \
    $(LOCAL_PATH)/prebuilt/root/sbin/e2fsck_static:root/sbin/e2fsck_static \
    $(LOCAL_PATH)/prebuilt/root/sbin/tune2fs_static:root/sbin/tune2fs_static \
    $(LOCAL_PATH)/prebuilt/root/sbin/lge_fota:root/sbin/lge_fota \
    $(LOCAL_PATH)/prebuilt/root/sbin/mke2fs_static:root/sbin/mke2fs_static \
    $(LOCAL_PATH)/prebuilt/root/sbin/resize2fs_static:root/sbin/resize2fs_static \
    $(LOCAL_PATH)/prebuilt/root/sbin/chargerlogo:root/sbin/chargerlogo \
    $(LOCAL_PATH)/prebuilt/root/bootimages/LG_opening_logo.rle:root/bootimages/LG_opening_logo.rle \
    $(LOCAL_PATH)/prebuilt/root/init.qcom.sh:root/init.qcom.sh \
    $(LOCAL_PATH)/prebuilt/root/ueventd.rc:root/ueventd.rc \
    $(LOCAL_PATH)/prebuilt/root/init.rc:root/init.rc

# libraries the build system doesnt know how to make
#PRODUCT_COPY_FILES +=									    \
#    $(LOCAL_PATH)/prebuilt/lib/hw/copybit.msm7k.so:system/lib/hw/copybit.msm7k.so	    \
#    $(LOCAL_PATH)/prebuilt/lib/hw/lights.msm7k.so:system/lib/hw/lights.msm7k.so	    \
#    $(LOCAL_PATH)/prebuilt/lib/hw/overlay.default.so:system/lib/hw/overlay.default.so    \
#    $(LOCAL_PATH)/prebuilt/lib/hw/sensors.default.so:system/lib/hw/sensors.default.so    \
#    $(LOCAL_PATH)/prebuilt/lib/libOmxAacDec.so:system/lib/libOmxAacDec.so		    \
#    $(LOCAL_PATH)/prebuilt/lib/libOmxAdpcmDec.so:system/lib/libOmxAdpcmDec.so	    \
#    $(LOCAL_PATH)/prebuilt/lib/libOmxAmrDec.so:system/lib/libOmxAmrDec.so		    \
#    $(LOCAL_PATH)/prebuilt/lib/libOmxAmrEnc.so:system/lib/libOmxAmrEnc.so		    \
#    $(LOCAL_PATH)/prebuilt/lib/libOmxAmrRtpDec.so:system/lib/libOmxAmrRtpDec.so	    \
#    $(LOCAL_PATH)/prebuilt/lib/libOmxAmrwbDec.so:system/lib/libOmxAmrwbDec.so	    \
#    $(LOCAL_PATH)/prebuilt/lib/libOmxEvrcDec.so:system/lib/libOmxEvrcDec.so		    \
#    $(LOCAL_PATH)/prebuilt/lib/libOmxMp3Dec.so:system/lib/libOmxMp3Dec.so		    \
#    $(LOCAL_PATH)/prebuilt/lib/libOmxQcelp13Dec.so:system/lib/libOmxQcelp13Dec.so	    \
#    $(LOCAL_PATH)/prebuilt/lib/libOmxQcelp13Enc.so:system/lib/libOmxQcelp13Enc.so	    \
#    $(LOCAL_PATH)/prebuilt/lib/libOmxQcelpHwDec.so:system/lib/libOmxQcelpHwDec.so	    \
#    $(LOCAL_PATH)/prebuilt/lib/libOmxWmaDec.so:system/lib/libOmxWmaDec.so

# libraries the build system doesnt know how to make
PRODUCT_COPY_FILES +=									    \
    $(LOCAL_PATH)/prebuilt/lib/hw/sensors.default.so:system/lib/hw/sensors.default.so	    \
    $(LOCAL_PATH)/prebuilt/lib/libOmxAacDec.so:system/lib/libOmxAacDec.so		    \
    $(LOCAL_PATH)/prebuilt/lib/libOmxAdpcmDec.so:system/lib/libOmxAdpcmDec.so		    \
    $(LOCAL_PATH)/prebuilt/lib/libOmxAmrDec.so:system/lib/libOmxAmrDec.so		    \
    $(LOCAL_PATH)/prebuilt/lib/libOmxAmrEnc.so:system/lib/libOmxAmrEnc.so		    \
    $(LOCAL_PATH)/prebuilt/lib/libOmxAmrRtpDec.so:system/lib/libOmxAmrRtpDec.so		    \
    $(LOCAL_PATH)/prebuilt/lib/libOmxAmrwbDec.so:system/lib/libOmxAmrwbDec.so		    \
    $(LOCAL_PATH)/prebuilt/lib/libOmxEvrcDec.so:system/lib/libOmxEvrcDec.so		    \
    $(LOCAL_PATH)/prebuilt/lib/libOmxMp3Dec.so:system/lib/libOmxMp3Dec.so		    \
    $(LOCAL_PATH)/prebuilt/lib/libOmxQcelp13Dec.so:system/lib/libOmxQcelp13Dec.so	    \
    $(LOCAL_PATH)/prebuilt/lib/libOmxQcelp13Enc.so:system/lib/libOmxQcelp13Enc.so	    \
    $(LOCAL_PATH)/prebuilt/lib/libOmxQcelpHwDec.so:system/lib/libOmxQcelpHwDec.so	    \
    $(LOCAL_PATH)/prebuilt/lib/libOmxWmaDec.so:system/lib/libOmxWmaDec.so

# audio and stuff
PRODUCT_COPY_FILES +=									    \
    $(LOCAL_PATH)/prebuilt/lib/libaudioalsa.so:system/lib/libaudioalsa.so		    \
    $(LOCAL_PATH)/prebuilt/lib/libaudioalsa.so:obj/lib/libaudioalsa.so

# needed for atfwd daemon in init.rc
#PRODUCT_COPY_FILES +=									    \
#    $(LOCAL_PATH)/prebuilt/lib/libhardware_legacy.so:system/lib/libhardware_legacy.so   \
#    $(LOCAL_PATH)/prebuilt/lib/libhardware_legacy.so:obj/lib/libhardware_legacy.so	    \
#    $(LOCAL_PATH)/prebuilt/lib/libwpa_client.so:system/lib/libwpa_client.so		    \
#    $(LOCAL_PATH)/prebuilt/lib/libwpa_client.so:obj/lib/libwpa_client.so


# egl stuff
PRODUCT_COPY_FILES +=											    \
    $(LOCAL_PATH)/prebuilt/lib/libgsl.so:system/lib/libgsl.so						    \
    $(LOCAL_PATH)/prebuilt/lib/libgsl.so:obj/lib/libgsl.so						    \
    $(LOCAL_PATH)/prebuilt/lib/egl/eglsubAndroid.so:system/lib/egl/eglsubAndroid.so			    \
    $(LOCAL_PATH)/prebuilt/lib/egl/libGLESv2_adreno200.so:system/lib/egl/libGLESv2_adreno200.so		    \
    $(LOCAL_PATH)/prebuilt/lib/egl/libGLESv1_CM_adreno200.so:system/lib/egl/libGLESv1_CM_adreno200.so	    \
    $(LOCAL_PATH)/prebuilt/lib/egl/libq3dtools_adreno200.so:system/lib/egl/libq3dtools_adreno200.so

# the build system apparently knows how to make this one
# $(LOCAL_PATH)/prebuilt/lib/egl/libEGL_adreno200.so:system/lib/egl/libEGL_adreno200.so

# binaries the build system doesn't know how to make
PRODUCT_COPY_FILES +=									    \
    $(LOCAL_PATH)/prebuilt/bin/cnd:system/bin/cnd					    \
    $(LOCAL_PATH)/prebuilt/bin/qmiproxy:system/bin/qmiproxy				    \
    $(LOCAL_PATH)/prebuilt/bin/qmuxd:system/bin/qmuxd					    \
    $(LOCAL_PATH)/prebuilt/bin/netmgrd:system/bin/netmgrd				    \
    $(LOCAL_PATH)/prebuilt/bin/ATFWD-daemon:system/bin/ATFWD-daemon			    \
    $(LOCAL_PATH)/prebuilt/bin/port-bridge:system/bin/port-bridge			    \
    $(LOCAL_PATH)/prebuilt/bin/rmt_storage:system/bin/rmt_storage

# hell, throw rild in there, too.  maybe itll get the radio stuff working
# (not tossing libril.so in the /out for linking against because something doesnt happen right)
PRODUCT_COPY_FILES +=									    \
    $(LOCAL_PATH)/prebuilt/bin/rild:system/bin/rild					    \
    $(LOCAL_PATH)/prebuilt/lib/libril.so:system/lib/libril.so

# libraries needed for the ril crap.  copy to /obj for linking against if they need to be
PRODUCT_COPY_FILES +=										    \
    $(LOCAL_PATH)/prebuilt/lib/libril-qc-qmi-1.so:system/lib/libril-qc-qmi-1.so			    \
    $(LOCAL_PATH)/prebuilt/lib/libril-qc-qmi-1.so:obj/lib/libril-qc-qmi-1.so			    \
    $(LOCAL_PATH)/prebuilt/lib/libril-qcril-hook-oem.so:system/lib/libril-qcril-hook-oem.so	    \
    $(LOCAL_PATH)/prebuilt/lib/libril-qcril-hook-oem.so:obj/lib/libril-qcril-hook-oem.so	    \
    $(LOCAL_PATH)/prebuilt/lib/libdiag.so:system/lib/libdiag.so					    \
    $(LOCAL_PATH)/prebuilt/lib/libdiag.so:obj/lib/libdiag.so					    \
    $(LOCAL_PATH)/prebuilt/lib/libqmi.so:system/lib/libqmi.so					    \
    $(LOCAL_PATH)/prebuilt/lib/libqmi.so:obj/lib/libqmi.so					    \
    $(LOCAL_PATH)/prebuilt/lib/libdsutils.so:system/lib/libdsutils.so				    \
    $(LOCAL_PATH)/prebuilt/lib/libdsutils.so:obj/lib/libdsutils.so				    \
    $(LOCAL_PATH)/prebuilt/lib/libqmiservices.so:system/lib/libqmiservices.so			    \
    $(LOCAL_PATH)/prebuilt/lib/libqmiservices.so:obj/lib/libqmiservices.so			    \
    $(LOCAL_PATH)/prebuilt/lib/libidl.so:system/lib/libidl.so					    \
    $(LOCAL_PATH)/prebuilt/lib/libidl.so:obj/lib/libidl.so					    \
    $(LOCAL_PATH)/prebuilt/lib/libdsi_netctrl.so:system/lib/libdsi_netctrl.so			    \
    $(LOCAL_PATH)/prebuilt/lib/libdsi_netctrl.so:obj/lib/libdsi_netctrl.so			    \
    $(LOCAL_PATH)/prebuilt/lib/libnetmgr.so:system/lib/libnetmgr.so				    \
    $(LOCAL_PATH)/prebuilt/lib/libnetmgr.so:obj/lib/libnetmgr.so				    \
    $(LOCAL_PATH)/prebuilt/lib/libqdp.so:system/lib/libqdp.so					    \
    $(LOCAL_PATH)/prebuilt/lib/libqdp.so:obj/lib/libqdp.so					    \
    $(LOCAL_PATH)/prebuilt/lib/liboem_rapi.so:system/lib/liboem_rapi.so				    \
    $(LOCAL_PATH)/prebuilt/lib/liboem_rapi.so:obj/lib/liboem_rapi.so				    \
    $(LOCAL_PATH)/prebuilt/lib/liboncrpc.so:system/lib/liboncrpc.so				    \
    $(LOCAL_PATH)/prebuilt/lib/liboncrpc.so:obj/lib/liboncrpc.so				    \
    $(LOCAL_PATH)/prebuilt/lib/libdsm.so:system/lib/libdsm.so					    \
    $(LOCAL_PATH)/prebuilt/lib/libdsm.so:obj/lib/libdsm.so					    \
    $(LOCAL_PATH)/prebuilt/lib/libqueue.so:system/lib/libqueue.so				    \
    $(LOCAL_PATH)/prebuilt/lib/libqueue.so:obj/lib/libqueue.so					    \
    $(LOCAL_PATH)/prebuilt/lib/libnv.so:system/lib/libnv.so					    \
    $(LOCAL_PATH)/prebuilt/lib/libnv.so:obj/lib/libnv.so

# required by sensors.default.so
PRODUCT_COPY_FILES +=										    \
    $(LOCAL_PATH)/prebuilt/lib/libacdapi_azi.so:system/lib/libacdapi_azi.so

# proprietary wifi kernel modules
PRODUCT_COPY_FILES +=												\
    $(LOCAL_PATH)/prebuilt/lib/modules/librasdioif.ko:system/lib/modules/librasdioif.ko				\
    $(LOCAL_PATH)/prebuilt/lib/modules/volans/WCN1314_rf.ko:system/lib/modules/volans/WCN1314_rf.ko		\
    $(LOCAL_PATH)/prebuilt/lib/modules/volans/WCN1314_rf_ftm.ko:system/lib/modules/volans/WCN1314_rf_ftm.ko
