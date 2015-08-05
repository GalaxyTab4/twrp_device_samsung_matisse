LOCAL_PATH := device/samsung/matisse

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/kernel:kernel \
    $(LOCAL_PATH)/dt.img:dt.img 

PRODUCT_DEVICE := matisse
PRODUCT_NAME := cm_matisse
PRODUCT_BRAND := Samsung
PRODUCT_MODEL := SM-T5XX
PRODUCT_MANUFACTURER := Samsung
