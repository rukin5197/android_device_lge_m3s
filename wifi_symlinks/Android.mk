ifeq ($(TARGET_BOOTLOADER_BOARD_NAME),lge_m3s)

LOCAL_PATH := $(call my-dir)


# wifi driver needs some symlinks
# this should hopefully end up with something like this in the updater-script
#
# symlink( "/system/lib/modules/volans/WCN1314_rf.ko", "/system/lib/modules/wlan.ko");
# symlink( "/data/misc/wifi/WCN1314_qcom_cfg.ini", "/system/etc/firmware/wlan/volans/WCN1314_qcom_cfg.ini");
# symlink( "/data/misc/wifi/WCN1314_qcom_wlan_nv.bin", "/system/etc/firmware/wlan/volans/WCN1314_qcom_wlan_nv.bin");
#

################################

# Symlink: /system/lib/modules/wlan.ko -> /system/lib/modules/volans/WCN1314_rf.ko
LOCAL_MODULE := wlan.ko
_symlink := $(PRODUCT_OUT)/system/lib/modules/wlan.ko
$(_symlink) :
	@echo "Symlink: $@ -> /system/lib/modules/volans/WCN1314_rf.ko"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /system/lib/modules/volans/WCN1314_rf.ko $@

ALL_DEFAULT_INSTALLED_MODULES += $(_symlink)

################################

# Symlink: /system/etc/firmware/wlan/volans/WCN1314_qcom_cfg.ini -> /data/misc/wifi/WCN1314_qcom_cfg.ini
LOCAL_MODULE := WCN1314_qcom_cfg.ini
_symlink := $(PRODUCT_OUT)/system/etc/firmware/wlan/volans/WCN1314_qcom_cfg.ini
$(_symlink) :
	@echo "Symlink: $@ -> /data/misc/wifi/WCN1314_qcom_cfg.ini"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /data/misc/wifi/WCN1314_qcom_cfg.ini $@

ALL_DEFAULT_INSTALLED_MODULES += $(_symlink)

################################

# Symlink: /system/etc/firmware/wlan/volans/WCN1314_qcom_wlan_nv.bin -> /data/misc/wifi/WCN1314_qcom_wlan_nv.bin
LOCAL_MODULE := WCN1314_qcom_wlan_nv.bin
_symlink := $(PRODUCT_OUT)/system/etc/firmware/wlan/volans/WCN1314_qcom_wlan_nv.bin
$(_symlink) :
	@echo "Symlink: $@ -> /data/misc/wifi/WCN1314_qcom_wlan_nv.bin"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /data/misc/wifi/WCN1314_qcom_wlan_nv.bin $@

ALL_DEFAULT_INSTALLED_MODULES += $(_symlink)

################################

endif # TARGET_BOOTLOADER_BOARD_NAME
