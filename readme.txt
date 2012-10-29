This is a work-in-progress for porting cm7 to run on the LG VM696 phone.
- Current status -

* I'm booting it up with a stock(ish) kernel and ramdisk.  I haven't tried to boot the boot.img created by this build system.
* It boots and runs pretty snappy
* phone calls work (havent tested 911), the java portion thinks it is roaming, but I don't think it really is
* sound
* all the hardware buttons and touchscreen
* sensor library
* bluetooth turns on, i haven't tried to connect to anything

Stuff that isnt working-
* sdcard & microSD
* wifi
* data (text messages and 3g)
* the hardware buttons dont light up when you press them
* gps

















possible (close) matches for libcamera...
"cam_frame"
"wait_cam_frame_thread_ready"
"cam_frame_set_exit_flag"
"camframe_terminate"
"jpeg_encoder_init"
"jpeg_encoder_encode"
"jpeg_encoder_join"
"camframe_add_frame"
"camframe_release_all_frames"
"mmcamera_shutter_callback"
"jpeg_encoder_setMainImageQuality"
"jpeg_encoder_setThumbnailQuality"
"jpeg_encoder_setRotation"
"jpeg_encoder_get_buffer_offset"
"jpeg_encoder_set_3D_info"
"cam_conf"
"launch_cam_conf_thread"
"release_cam_conf_thread"
"cancel_liveshot"
"set_liveshot_params"
"mm_camera_destroy"

still missing...
"wait_cam_frame_thread_ready"
"cam_frame_set_exit_flag"


https://github.com/thepasto/android_device_acer_salsa/blob/gingerbread/libcamera/QualcommCameraHardware.cpp

but its still missing these...

    *(void **)&LINK_mmcamera_camframe_callback =
        ::dlsym(libmmcamera, "mmcamera_camframe_callback");

    *(void **)&LINK_camframe_timeout_callback =
        ::dlsym(libmmcamera, "camframe_timeout_callback");

    // 720 p new recording functions
    *(void **)&LINK_cam_frame_flush_free_video = ::dlsym(libmmcamera, "cam_frame_flush_free_video");

    *(void **)&LINK_camframe_free_video = ::dlsym(libmmcamera, "cam_frame_add_free_video");

    *(void **)&LINK_camframe_video_callback = ::dlsym(libmmcamera, "mmcamera_camframe_videocallback");
        *LINK_camframe_video_callback = receive_camframe_video_callback;

    *(void **)&LINK_mmcamera_shutter_callback =
        ::dlsym(libmmcamera, "mmcamera_shutter_callback");



