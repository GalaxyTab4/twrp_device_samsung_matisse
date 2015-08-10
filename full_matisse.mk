$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

$(call inherit-product, device/samsung/matisse/device.mk)

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
	PRODUCT_COPY_FILES += device/samsung/matisse/kernel:kernel 
	PRODUCT_COPY_FILES += device/samsung/matisse/dt.img:dt.img 
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

#PRODUCT_DEVICE := matisse
#PRODUCT_MODEL := SM-T5XX
PRODUCT_NAME := cm_matisse
PRODUCT_BRAND := Samsung
PRODUCT_MANUFACTURER := Samsung
