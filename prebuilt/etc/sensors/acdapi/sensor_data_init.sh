if ls /persist/sensors.dat ; then
	echo "Already coping" > /data/sensor_init.log
else
	echo "Need to copy" > /data/sensor_init.log
	cat /system/etc/sensors/acdapi/calib.dat > /persist/calib.dat    
	cat /system/etc/sensors/acdapi/sensors.dat > /persist/sensors.dat
	cat /system/etc/sensors/acdapi/param.dat > /persist/param.dat	
fi