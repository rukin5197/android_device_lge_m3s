$(call inherit-product, device/lge/m3s/full_m3s.mk)

PRODUCT_RELEASE_NAME := m3s

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/cdma.mk)

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=htc_primou BUILD_FINGERPRINT=htc_europe/htc_primou/primou:2.3.5/GRJ90/156318.4:user/release-keys PRIVATE_BUILD_DESC="2.10.401.4 CL156318 release-keys"

PRODUCT_NAME := cm_m3s
PRODUCT_DEVICE := m3s

#
# Set up the product codename, build version & MOTD.
#
PRODUCT_CODENAME := Rukin5197
PRODUCT_VERSION_DEVICE_SPECIFIC := 1.0

# Bootanimation
PRODUCT_COPY_FILES += \
    vendor/cm/prebuilt/common/bootanimation/vertical-320x480.zip:system/media/bootanimation.zip
