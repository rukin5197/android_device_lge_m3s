#!/system/bin/sh
#this script unload normal wlan module and load FTM module

setprop ctl.stop wpa_supplicant
rmmod wlan
#rmmod WCN1314_rf
/system/etc/init.qcom.sdio.sh 1
insmod /system/lib/modules/librasdioif.ko
insmod /system/lib/modules/volans/WCN1314_rf_ftm.ko
/system/etc/init.qcom.sdio.sh 0
