
LOCAL_PATH := device/samsung/matisse

PRODUCT_CHARACTERISTICS := tablet

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    device/samsung/matisse/kernel/kernel:kernel \

PRODUCT_COPY_FILES += \
    device/samsung/matisse/sbin/sysinit:root/sbin/sysinit \

PRODUCT_COPY_FILES += \
    device/samsung/matisse/theme/curtain.jpg:root/twres/images/curtain.jpg \

PRODUCT_COPY_FILES += \
    device/samsung/matisse/rootdir/fstab.qcom:root/fstab.qcom \

PRODUCT_PACKAGES += \
    charger_res_images

PRODUCT_PACKAGES += \
    make_ext4fs \
    setup_fs

ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.adb.secure=0

