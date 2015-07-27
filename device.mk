LOCAL_PATH := device/samsung/matisse

$(call inherit-product, build/target/product/full.mk)

# Get non-open-source specific aspects
$(call inherit-product-if-exists, vendor/samsung/matisse/matisse-vendor.mk)

PRODUCT_NAME := matisse


