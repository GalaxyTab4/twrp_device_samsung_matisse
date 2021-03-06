
PREBUILT_RECOVERY := true
RECOVERY_VERSION := twrp20150922
RECOVERY_TYPE := mrwifi # twrp / mrwifi / mrlte

ifeq ($(PREBUILT_RECOVERY),true)
TARGET_PREBUILT_RECOVERY_KERNEL := device/samsung/matisse/kernel
BOARD_CUSTOM_BOOTIMG_MK := device/samsung/matisse/custom_mkbootimg.mk
else
TARGET_KERNEL_CONFIG := twrp-matissewifi_defconfig
BOARD_CUSTOM_BOOTIMG_MK := device/samsung/matisse/mkbootimg.mk
endif

# Bootloader
TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := MSM8226

# Platform
TARGET_BOARD_PLATFORM := msm8226

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_CPU_VARIANT := krait
ARCH_ARM_HAVE_TLS_REGISTER := true

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00A00000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00A7DEA0
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2097152000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12562627584
BOARD_USES_MMCUTILS := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Flags
TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp

# TARGET_OTA_ASSERT_DEVICE := matisse,matissewifi,matissewifiue,matisse3g,matisselte

# Vendor Init
TARGET_UNIFIED_DEVICE := true
TARGET_INIT_VENDOR_LIB := libinit_msm
TARGET_LIBINIT_DEFINES_FILE := device/samsung/matisse/init_matisse.c

TARGET_RECOVERY_INITRC := device/samsung/matisse/init.recovery.qcom.rc
TARGET_KERNEL_SOURCE := kernel/samsung/s3ve3g
BOARD_KERNEL_CMDLINE := console=null androidboot.console=null androidboot.hardware=qcom user_debug=23 msm_rtb.filter=0x37 androidboot.bootdevice=msm_sdcc.1
BOARD_MKBOOTIMG_ARGS := --board $(RECOVERY_VERSION) --dt device/samsung/matisse/dt.img --kernel_offset 0x00008000 --ramdisk_offset 0x02000000 --tags_offset 0x1e00000
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_SEPARATED_DT := true

#TWRP config:
#TW_NEW_ION_HEAP := true
TW_HAS_DOWNLOAD_MODE := true
TW_INTERNAL_STORAGE_PATH := "/data/media"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
TW_DEFAULT_EXTERNAL_STORAGE := true
TW_BRIGHTNESS_PATH := /sys/class/leds/lcd-backlight/brightness
#TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true
#TW_INCLUDE_CRYPTO := true
RECOVERY_GRAPHICS_USE_LINELENGTH := true
RECOVERY_SDCARD_ON_DATA := true
BOARD_SUPPRESS_SECURE_ERASE := true
TW_NO_REBOOT_BOOTLOADER := true
HAVE_SELINUX := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
COMMON_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD
TARGET_RECOVERY_DEVICE_DIRS += device/samsung/matisse

ifeq ($(PREBUILT_TYPE),twrp)
RECOVERY_VARIANT := twrp
TW_CUSTOM_THEME := $(LOCAL_PATH)/theme/rework
else
RECOVERY_VARIANT := mr
TW_THEME := landscape_hdpi
endif

ifeq ($(PREBUILT_TYPE),mrwifi)
MR_INPUT_TYPE := type_b
MR_INIT_DEVICES := device/samsung/matisse/mr_init_devices.c
MR_DPI := hdpi
MR_DPI_MUL := 1
MR_DPI_FONT := 160
MR_FSTAB := device/samsung/matisse/recovery.fstab
MR_INFOS := device/samsung/matisse/mrom_infos
MR_KEXEC_MEM_MIN := 0x06200000
MR_DEVICE_VARIANTS := matissewifi matissewifiue matisse3g 
MR_KEXEC_DTB := true
MR_PIXEL_FORMAT := "RGBX_8888"
MR_USE_QCOM_OVERLAY := true
MR_QCOM_OVERLAY_HEADER := device/samsung/matisse/mr_qcom_overlay.h
MR_QCOM_OVERLAY_CUSTOM_PIXEL_FORMAT := MDP_RGBX_8888
MR_CONTINUOUS_FB_UPDATE := true
MR_DEVICE_HOOKS := device/samsung/matisse/mr_hooks.c
MR_DEVICE_HOOKS_VER := 3
else
ifeq ($(PREBUILT_TYPE),mrlte)
MR_INPUT_TYPE := type_b
MR_INIT_DEVICES := device/samsung/matisse/mr_init_devices.c
MR_DPI := hdpi
MR_DPI_MUL := 1
MR_DPI_FONT := 160
MR_FSTAB := device/samsung/matisse/recovery.fstab
MR_INFOS := device/samsung/matisse/mrom_infos
MR_KEXEC_MEM_MIN := 0x05500000
MR_DEVICE_VARIANTS := matisselte
MR_KEXEC_DTB := true
MR_PIXEL_FORMAT := "RGBX_8888"
MR_USE_QCOM_OVERLAY := true
MR_QCOM_OVERLAY_HEADER := device/samsung/matisse/mr_qcom_overlay.h
MR_QCOM_OVERLAY_CUSTOM_PIXEL_FORMAT := MDP_RGBX_8888
MR_CONTINUOUS_FB_UPDATE := true
MR_DEVICE_HOOKS := device/samsung/matisse/mr_hooks.c
MR_DEVICE_HOOKS_VER := 3
else

endif
endif

# Charging mode
BOARD_CHARGING_MODE_BOOTING_LPM := /sys/class/power_supply/battery/batt_lp_charging
BOARD_BATTERY_DEVICE_NAME := "battery"
BOARD_CHARGING_CMDLINE_NAME := "androidboot.mode"
BOARD_CHARGING_CMDLINE_VALUE := "charger"
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_CHARGER_SHOW_PERCENTAGE := true

# Vold 
BOARD_UMS_LUNFILE 				:= /sys/devices/platform/msm_hsusb/gadget/lun0/file
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun0/file

# Block_Build
Bliss_Build_Block := 1

# BlissPop Configs
BLISS_WIPE_CACHES := 0
BLISSIFY := true
BLISS_O3 := true
BLISS_GRAPHITE := true
BLISS_STRICT := true
BLISS_KRAIT := true
BLISS_PIPE := true
TARGET_TC_ROM := 5.2-linaro
TARGET_TC_KERNEL := 5.1-sm
TARGET_GCC_VERSION_EXP := $(TARGET_TC_ROM)
TARGET_KERNEL_CUSTOM_TOOLCHAIN := $(TARGET_TC_KERNEL)
WITH_LZMA_OTA := true

#SaberMod
-include vendor/bliss/config/sm.mk

