$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

PRODUCT_COPY_FILES += \
    device/samsung/matisse/kernel:kernel \
    device/samsung/matisse/dt.img:dt.img

PRODUCT_DEVICE := matisse
PRODUCT_NAME := cm_matisse
PRODUCT_BRAND := Samsung
PRODUCT_MODEL := SM-T5XX
PRODUCT_MANUFACTURER := Samsung
