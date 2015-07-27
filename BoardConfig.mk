TARGET_OTA_ASSERT_DEVICE := matissewifi,matissewifiue,matissewifiuexx,matisse3g,matisse3gxx,matisselte,matisseltexx,matisse

# Vendor Init
TARGET_UNIFIED_DEVICE := true
TARGET_INIT_VENDOR_LIB := libinit_matisse
TARGET_LIBINIT_DEFINES_FILE := init_matisse.c

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

# Encryption
#TARGET_HW_DISK_ENCRYPTION := true

# Flags
TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp

# Qualcomm support
COMMON_GLOBAL_CFLAGS += -DQCOM_BSP
TARGET_USES_QCOM_BSP := true

# Time services
BOARD_USES_QC_TIME_SERVICES := true

BOARD_CUSTOM_BOOTIMG_MK := device/samsung/matisse/mkbootimg.mk
TARGET_KERNEL_SOURCE := kernel/samsung/msm8226
TARGET_KERNEL_CONFIG := matisse_defconfig
BOARD_KERNEL_SEPARATED_DT := true

BOARD_KERNEL_CMDLINE := console=null androidboot.console=null androidboot.hardware=qcom user_debug=23 msm_rtb.filter=0x37 androidboot.bootdevice=msm_sdcc.1
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048

BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000 --tags_offset 0x1e00000

# USB Mounting
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun0/file

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := device/samsung/matisse

# Recovery
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
#TARGET_RECOVERY_QCOM_RTC_FIX := true

# TWRP-Specific

#TWRP_EVENT_LOGGING := true
TW_HAS_MTP := true
TW_THEME := landscape_hdpi
TW_NEW_ION_HEAP := true
#TW_DISABLE_DOUBLE_BUFFERING := true
HAVE_SELINUX := true
RECOVERY_SDCARD_ON_DATA := true
TW_FLASH_FROM_STORAGE := true
#TW_SCREEN_BLANK_ON_BOOT := true
#TW_NO_USB_STORAGE := true
TW_INCLUDE_CRYPTO := true
TW_BRIGHTNESS_PATH := /sys/class/leds/lcd-backlight/brightness
RECOVERY_GRAPHICS_USE_LINELENGTH := true
BOARD_SUPPRESS_SECURE_ERASE := true
TW_HAS_DOWNLOAD_MODE := true

MR_INPUT_TYPE := type_b
MR_INIT_DEVICES := device/samsung/matisse/mr_init_devices.c
MR_DPI := hdpi
MR_DPI_MUL := 1
MR_DPI_FONT := 160
MR_FSTAB := device/samsung/matisse/recovery.fstab
MR_USE_MROM_FSTAB := true
# End of first RAM region is 0x083fffff, so we set it to for example 0x06500000
MR_KEXEC_MEM_MIN := 0x06200000
MR_RD_ADDR := 0x02200000
MR_KEXEC_DTB := true
MR_PIXEL_FORMAT := "RGBX_8888"
MR_USE_QCOM_OVERLAY := true
MR_QCOM_OVERLAY_HEADER := device/samsung/matisse/mr_qcom_overlay.h
MR_QCOM_OVERLAY_CUSTOM_PIXEL_FORMAT := MDP_RGBX_8888
MR_DEVICE_VARIANTS := matissewifi matisse3g matisselte matissewifiue

# SELinux
-include device/qcom/sepolicy/sepolicy.mk

