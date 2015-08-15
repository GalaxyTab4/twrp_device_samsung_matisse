$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

$(call inherit-product, device/samsung/matisse/device.mk)

PRODUCT_COPY_FILES += \
    device/samsung/matisse/kernel:kernel \
    device/samsung/matisse/dt.img:dt.img

PRODUCT_NAME := cm_matisse
PRODUCT_BRAND := Samsung
PRODUCT_MANUFACTURER := Samsung
