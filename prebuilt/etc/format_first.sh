# LGE_MPT_PARTITION /mpt
mpt_partition=/dev/block/mmcblk0p21
    echo "Format_first"
    /system/bin/mount -r -t ext4 $mpt_partition /mpt
    if /system/bin/ls /mpt/started; then
        /system/bin/umount /mpt
        echo [[[[[ No Need of Format $mpt_partition partition ]]]]]
    else
        echo [[[[[ Need of Format $mpt_partition partition ]]]]] 
        /system/bin/umount /mpt
        /system/bin/mke2fs -t ext4 $mpt_partition
    fi

