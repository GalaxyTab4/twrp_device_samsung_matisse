$(call inherit-product, device/samsung/matisse/full_matisse.mk)

$(call inherit-product, vendor/bliss/config/common_full_tablet_wifionly.mk)

#PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=SGH-I727 TARGET_DEVICE=SGH-I727 BUILD_FINGERPRINT="samsung/SGH-I727/SGH-I727:4.1.2/IMM76D/UCLI3:user/release-keys" PRIVATE_BUILD_DESC="SGH-I727-user 4.1.2 IMM76D UCLI3 release-keys"

PRODUCT_NAME := bliss_matisse
PRODUCT_DEVICE := matisse
