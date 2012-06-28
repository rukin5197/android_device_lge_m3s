## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := m3s

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/LGE/m3s/device_m3s.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := m3s
PRODUCT_NAME := cm_m3s
PRODUCT_BRAND := LGE
PRODUCT_MODEL := m3s
PRODUCT_MANUFACTURER := LGE
