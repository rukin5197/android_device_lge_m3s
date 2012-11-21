#
# Copyright (C) 2012 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)


## (1) First, the most specific values, i.e. the aspects that are specific to CDMA

PRODUCT_COPY_FILES += \
    device/lge/m3s/prebuilt/etc/init.qcom.sdio.sh:system/etc/init.qcom.sdio.sh \
    device/lge/m3s/prebuilt/etc/format_fat32.sh:system/etc/format_fat32.sh \
    device/lge/m3s/prebuilt/etc/format_first.sh:system/etc/format_first.sh \
    device/lge/m3s/prebuilt/etc/init.qcom.bt.sh:system/etc/init.qcom.bt.sh \
    device/lge/m3s/prebuilt/etc/init.qcom.coex.sh:system/etc/init.qcom.coex.sh \
    device/lge/m3s/prebuilt/etc/init.qcom.fm.sh:system/etc/init.qcom.fm.sh \
    device/lge/m3s/prebuilt/etc/init.qcom.ftm_module.sh:system/etc/init.qcom.ftm_module.sh \
    device/lge/m3s/prebuilt/etc/init.qcom.ftm_module_out.sh:system/etc/init.qcom.ftm_module_out.sh \
    device/lge/m3s/prebuilt/etc/init.qcom.post_boot.sh:system/etc/init.qcom.post_boot.sh \
    device/lge/m3s/prebuilt/etc/init.qcom.sdio.sh:system/etc/init.qcom.sdio.sh \
    device/lge/m3s/prebuilt/etc/init.qcom.wifi.sh:system/etc/init.qcom.wifi.sh \
    device/lge/m3s/prebuilt/etc/last_kmsg_backup.sh:system/etc/last_kmsg_backup.sh

PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml

## (2) Also get non-open-source GSM-specific aspects if available
$(call inherit-product-if-exists, vendor/lge/m3s/m3s-vendor.mk)

## (3)  Finally, the least specific parts, i.e. the non-GSM-specific aspects
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1 \
    ro.com.google.gmsversion=2.3_r3 \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.dexopt-flags=m=y \
    ro.sf.lcd_density=240

# Carrier Info
CDMA_GOOGLE_BASE := android-sprint-us
CDMA_CARRIER_ALPHA := Virgin_Mobile
CDMA_CARRIER_NUMERIC := 311490

# Property Overides for carrier
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=$(CDMA_GOOGLE_BASE) \
    ro.cdma.home.operator.alpha=$(CDMA_CARRIER_ALPHA) \
    ro.cdma.home.operator.numeric=$(CDMA_CARRIER_NUMERIC) \
    gsm.sim.operator.alpha=$(CDMA_CARRIER_ALPHA) \
    gsm.sim.operator.numeric=$(CDMA_CARRIER_NUMERIC) \
    gsm.operator.alpha=$(CDMA_CARRIER_ALPHA) \
    gsm.operator.numeric=$(CDMA_CARRIER_NUMERIC)

# Override /proc/sys/vm/dirty_ratio on UMS
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vold.umsdirtyratio=20

DEVICE_PACKAGE_OVERLAYS += device/lge/m3s/overlay

# GPS / Lights / Sensors
PRODUCT_PACKAGES += \
    gps.$(TARGET_BOOTLOADER_BOARD_NAME) \
    lights.msm7x30 \
    sensors.msm7x30

# audio
PRODUCT_PACKAGES += \
  audio.a2dp.default 

# video
PRODUCT_PACKAGES += \
  libI420colorconvert

# Additional packages
PRODUCT_PACKAGES += \
    FileExplorer

# idc files
PRODUCT_COPY_FILES += \
    device/lge/m3s/prebuilt/usr/idc/atcmd_virtual_kbd.idc:system/usr/idc/atcmd_virtual_kbd.idc \
    device/lge/m3s/prebuilt/usr/idc/gpio-side-keypad.idc:system/usr/idc/gpio-side-keypad.idc \
    device/lge/m3s/prebuilt/usr/idc/touch_mcs8000.idc:system/usr/idc/touch_mcs8000.idc \
    device/lge/m3s/prebuilt/usr/idc/gpio-side-keypad.idc:system/usr/idc/gpio-side-keypad.idc

PRODUCT_COPY_FILES += \
    device/lge/m3s/prebuilt/etc/vold.fstab:system/etc/vold.fstab

# Keychar & Keylayout
PRODUCT_COPY_FILES += \
    device/lge/m3s/keychars/atcmd_virtual_kbd.kcm.bin:system/usr/keychars/atcmd_virtual_kbd.kcm.bin \
    device/lge/m3s/keychars/ats_input.kcm.bin:system/usr/keychars/ats_input.kcm.bin \
    device/lge/m3s/keychars/lge_m3s_keypad.kcm.bin:system/usr/keychars/lge_m3s_keypad.kcm.bin \
    device/lge/m3s/keychars/qwerty.kcm.bin:system/usr/keychars/qwerty.kcm.bin \
    device/lge/m3s/keychars/qwerty2.kcm.bin:system/usr/keychars/qwerty2.kcm.bin \
    device/lge/m3s/keylayout/7k_handset.kl:system/usr/keylayout/7k_handset.kl \
    device/lge/m3s/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    device/lge/m3s/keylayout/atcmd_virtual_kbd.kl:system/usr/keylayout/atcmd_virtual_kbd.kl \
    device/lge/m3s/keylayout/ats_input.kl:system/usr/keylayout/ats_input.kl \
    device/lge/m3s/keylayout/gpio-side-keypad.kl:system/usr/keylayout/gpio-side-keypad.kl \
    device/lge/m3s/keylayout/lge_m3s_keypad.kl:system/usr/keylayout/lge_m3s_keypad.kl \
    device/lge/m3s/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/lge/m3s/keylayout/touch_mcs8000.kl:system/usr/keylayout/touch_mcs8000.kl

# Sensor Calibration files
PRODUCT_COPY_FILES += \
    device/lge/m3s/prebuilt/etc/sensors/acdapi/calib.dat:system/etc/sensors/acdapi/calib.dat \
    device/lge/m3s/prebuilt/etc/sensors/acdapi/param.dat:system/etc/sensors/acdapi/param.dat \
    device/lge/m3s/prebuilt/etc/sensors/acdapi/sensor_data_init.sh:system/etc/sensors/acdapi/sensor_data_init.sh \
    device/lge/m3s/prebuilt/etc/sensors/acdapi/sensors.dat:system/etc/sensors/acdapi/sensors.dat

# Init files
PRODUCT_COPY_FILES +=\
    device/lge/m3s/prebuilt/root/chargerimages/battery_charging_08.rle:root/chargerimages/battery_charging_08.rle \
    device/lge/m3s/prebuilt/root/chargerimages/battery_charging_02.rle:root/chargerimages/battery_charging_02.rle \
    device/lge/m3s/prebuilt/root/chargerimages/battery_ani_05.rle:root/chargerimages/battery_ani_05.rle \
    device/lge/m3s/prebuilt/root/chargerimages/battery_charging_10.rle:root/chargerimages/battery_charging_10.rle \
    device/lge/m3s/prebuilt/root/chargerimages/battery_wait_ani_02.rle:root/chargerimages/battery_wait_ani_02.rle \
    device/lge/m3s/prebuilt/root/chargerimages/battery_notenough.rle:root/chargerimages/battery_notenough.rle \
    device/lge/m3s/prebuilt/root/chargerimages/black_bg.rle:root/chargerimages/black_bg.rle \
    device/lge/m3s/prebuilt/root/chargerimages/battery_charging_09.rle:root/chargerimages/battery_charging_09.rle \
    device/lge/m3s/prebuilt/root/chargerimages/battery_charging_12.rle:root/chargerimages/battery_charging_12.rle \
    device/lge/m3s/prebuilt/root/chargerimages/battery_charging_06.rle:root/chargerimages/battery_charging_06.rle \
    device/lge/m3s/prebuilt/root/chargerimages/battery2.rle:root/chargerimages/battery2.rle \
    device/lge/m3s/prebuilt/root/chargerimages/battery_charging_07.rle:root/chargerimages/battery_charging_07.rle \
    device/lge/m3s/prebuilt/root/chargerimages/battery_charging_11.rle:root/chargerimages/battery_charging_11.rle \
    device/lge/m3s/prebuilt/root/chargerimages/battery_charging_01.rle:root/chargerimages/battery_charging_01.rle \
    device/lge/m3s/prebuilt/root/chargerimages/battery_bg.rle:root/chargerimages/battery_bg.rle \
    device/lge/m3s/prebuilt/root/chargerimages/battery_ani_03.rle:root/chargerimages/battery_ani_03.rle \
    device/lge/m3s/prebuilt/root/chargerimages/battery_charging_04.rle:root/chargerimages/battery_charging_04.rle \
    device/lge/m3s/prebuilt/root/chargerimages/battery_charging_03.rle:root/chargerimages/battery_charging_03.rle \
    device/lge/m3s/prebuilt/root/chargerimages/battery_charging_05.rle:root/chargerimages/battery_charging_05.rle \
    device/lge/m3s/prebuilt/root/chargerimages/battery_ani_04.rle:root/chargerimages/battery_ani_04.rle \
    device/lge/m3s/prebuilt/root/chargerimages/battery_charging_00.rle:root/chargerimages/battery_charging_00.rle \
    device/lge/m3s/prebuilt/root/chargerimages/battery_ani_01.rle:root/chargerimages/battery_ani_01.rle \
    device/lge/m3s/prebuilt/root/chargerimages/battery_ani_02.rle:root/chargerimages/battery_ani_02.rle \
    device/lge/m3s/prebuilt/root/chargerimages/battery_wait_ani_01.rle:root/chargerimages/battery_wait_ani_01.rle \
    device/lge/m3s/prebuilt/root/sbin/bootlogo:root/sbin/bootlogo \
    device/lge/m3s/prebuilt/root/sbin/e2fsck_static:root/sbin/e2fsck_static \
    device/lge/m3s/prebuilt/root/sbin/tune2fs_static:root/sbin/tune2fs_static \
    device/lge/m3s/prebuilt/root/sbin/lge_fota:root/sbin/lge_fota \
    device/lge/m3s/prebuilt/root/sbin/mke2fs_static:root/sbin/mke2fs_static \
    device/lge/m3s/prebuilt/root/sbin/resize2fs_static:root/sbin/resize2fs_static \
    device/lge/m3s/prebuilt/root/sbin/chargerlogo:root/sbin/chargerlogo \
    device/lge/m3s/prebuilt/root/bootimages/LG_opening_logo.rle:root/bootimages/LG_opening_logo.rle \
    device/lge/m3s/prebuilt/root/init.qcom.rc:root/init.qcom.rc \
    device/lge/m3s/prebuilt/root/init.target.rc:root/init.target.rc \
    device/lge/m3s/prebuilt/root/init.qcom.sh:root/init.qcom.sh \
    device/lge/m3s/prebuilt/root/ueventd.rc:root/ueventd.rc \
    device/lge/m3s/prebuilt/root/init.rc:root/init.rc

# Modules
PRODUCT_COPY_FILES += \
    device/lge/m3s/prebuilt/lib/modules/librasdioif.ko:system/lib/modules/librasdioif.ko \
    device/lge/m3s/prebuilt/lib/modules/volans/WCN1314_rf.ko:system/lib/modules/volans/WCN1314_rf.ko \
    device/lge/m3s/prebuilt/lib/modules/volans/WCN1314_rf_ftm.ko:system/lib/modules/volans/WCN1314_rf_ftm.ko

# media config xml file
PRODUCT_COPY_FILES += \
    device/lge/m3s/prebuilt/etc/media_profiles.xml:system/etc/media_profiles.xml \
    device/lge/m3s/prebuilt/etc/audio_policy.conf:system/etc/audio_policy.conf

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/lge/m3s/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product, build/target/product/full_base.mk)
$(call inherit-product, frameworks/base/build/phone-mdpi-512-dalvik-heap.mk)
