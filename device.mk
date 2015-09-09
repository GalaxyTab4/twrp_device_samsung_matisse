ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.adb.secure=0

PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,device/samsung/matisse/sbin,root/sbin)


