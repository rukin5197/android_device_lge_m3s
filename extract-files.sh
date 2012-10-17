#!/bin/sh

VENDOR=lge
DEVICE=VM696

BASE=../../../vendor/$VENDOR/$DEVICE/proprietary
rm -rf $BASE/*

for FILE in `cat proprietary-files.txt | grep -v ^# | grep -v ^$`; do
    DIR=`dirname $FILE`
    if [ ! -d $BASE/$DIR ]; then
        mkdir -p $BASE/$DIR
    fi
    adb pull /system/$FILE $BASE/$FILE
done


# these two are a bit trickier because they are not world-readable, and they are in the /data instead of /system like everything else

#adb shell "su -c \"cp /data/misc/wifi/WCN1314_qcom_cfg.ini /data/local/tmp/WCN1314_qcom_cfg.ini && chmod 0666 /data/local/tmp/WCN1314_qcom_cfg.ini\""
#adb shell "su -c \"cp /data/misc/wifi/WCN1314_qcom_wlan_nv.bin /data/local/tmp/WCN1314_qcom_wlan_nv.bin && chmod 0666 /data/local/tmp/WCN1314_qcom_wlan_nv.bin\""

#DIR="data/misc/wifi"
#mkdir -p $BASE/$DIR
#adb pull "/data/local/tmp/WCN1314_qcom_cfg.ini" "$BASE/$DIR/WCN1314_qcom_cfg.ini"
#adb pull "/data/local/tmp/WCN1314_qcom_wlan_nv.bin" "$BASE/$DIR/WCN1314_qcom_wlan_nv.bin"

#adb shell rm "/data/local/tmp/WCN1314_qcom_cfg.ini" "/data/local/tmp/WCN1314_qcom_wlan_nv.bin"

./setup-makefiles.sh
