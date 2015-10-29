# Settings
MR_TYPE      := NONE # MRWIFI MRLTE
REC_TYPE     := TWRP # BOSP
KERNEL_PRE   := TRUE
TWRP_VERSION := T20151029

# Flags
TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp
COMMON_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD
TARGET_RECOVERY_DEVICE_DIRS += device/samsung/matisse
COMMON_GLOBAL_CFLAGS += -DQCOM_BSP

LOCAL_PATH                         := device/samsung/matisse
TARGET_OTA_ASSERT_DEVICE           := matissewifi,matissewifiue,matisse3g,matisselte,matisse

# Architecture
TARGET_ARCH                        := arm
TARGET_ARCH_VARIANT                := armv7-a-neon
TARGET_CPU_ABI                     := armeabi-v7a
TARGET_CPU_ABI2                    := armeabi
TARGET_CPU_SMP                     := true
TARGET_CPU_VARIANT                 := krait
ARCH_ARM_HAVE_TLS_REGISTER         := true

# Init
TARGET_INIT_VENDOR_LIB             := libinit_matisse
TARGET_LIBINIT_DEFINES_FILE        := $(LOCAL_PATH)/init/init_matisse.cpp
TARGET_UNIFIED_DEVICE              := true

# Kernel
BOARD_CUSTOM_BOOTIMG_MK            := $(LOCAL_PATH)/mkbootimg.mk
BOARD_MKBOOTIMG_ARGS               := --board $(TWRP_VERSION) --ramdisk_offset 0x02000000 --tags_offset 0x1e00000
TARGET_PREBUILT_KERNEL             := $(LOCAL_PATH)/kernel/kernel
BOARD_KERNEL_BASE                  := 0x00000000
BOARD_KERNEL_CMDLINE               := console=null androidboot.console=null androidboot.hardware=qcom user_debug=23 msm_rtb.filter=0x37 androidboot.bootdevice=msm_sdcc.1
BOARD_KERNEL_PAGESIZE              := 2048
TARGET_KERNEL_SOURCE               := kernel/samsung/matisse

ifneq ($(KERNEL_PRE),TRUE)
BOARD_KERNEL_SEPARATED_DT          := true
TARGET_KERNEL_CONFIG               := twrp_matissewifi_defconfig
endif # Kernel

# Partitions
BOARD_FLASH_BLOCK_SIZE             := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE     := 0x00A00000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00A7DEA0
BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 2097152000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12562627584
TARGET_USERIMAGES_USE_F2FS         := true

# Vold 
BOARD_UMS_LUNFILE                  := /sys/devices/platform/msm_hsusb/gadget/lun0/file
TARGET_USE_CUSTOM_LUN_FILE_PATH    := /sys/devices/platform/msm_hsusb/gadget/lun0/file

# Healthd
BOARD_HAL_STATIC_LIBRARIES         := libhealthd.qcom

# Charging mode
BOARD_CHARGING_MODE_BOOTING_LPM    := /sys/class/power_supply/battery/batt_lp_charging
BOARD_BATTERY_DEVICE_NAME          := "battery"
BOARD_CHARGING_CMDLINE_NAME        := "androidboot.mode"
BOARD_CHARGING_CMDLINE_VALUE       := "charger"
BOARD_CHARGER_ENABLE_SUSPEND       := true
BOARD_CHARGER_SHOW_PERCENTAGE      := true

# TWRP
TW_THEME := landscape_hdpi
TW_HAS_DOWNLOAD_MODE := true
TW_INTERNAL_STORAGE_PATH := "/data/media"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
TW_DEFAULT_EXTERNAL_STORAGE := true
TW_BRIGHTNESS_PATH := /sys/class/leds/lcd-backlight/brightness
TW_HAS_MTP := false
TW_NO_REBOOT_BOOTLOADER := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/rootdir/recovery.fstab
RECOVERY_GRAPHICS_USE_LINELENGTH := true
RECOVERY_SDCARD_ON_DATA := true
BOARD_SUPPRESS_SECURE_ERASE := true
HAVE_SELINUX := true

# MultiROM TWRP (WIFI & 3G)
ifeq ($(MR_TYPE),MRWIFI)
TW_THEME := landscape_hdpi
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
endif

# MultiROM TWRP (LTE)
ifeq ($(MR_TYPE),MRLTE)
TW_THEME := landscape_hdpi
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
endif # MultiROM TWRP (LTE)

# Build with BlissPop
ifeq ($(ROM_TYPE),BOSP)
RECOVERY_VARIANT := twrp
TW_CUSTOM_THEME := device/samsung/matisse/theme/rework

# BlissPop Configs
Bliss_Build_Block := 1
BLISS_BUILDTYPE := OFFICIAL
BLISS_DEVELOPER := SUB77
BLISS_WIPE_CACHES := 0
BLISSIFY := true
BLISS_O3 := true
BLISS_GRAPHITE := true
BLISS_STRICT := true
BLISS_KRAIT := true
BLISS_PIPE := true
TARGET_TC_ROM := 5.2-linaro
TARGET_TC_KERNEL := 4.9-sm
TARGET_GCC_VERSION_EXP := $(TARGET_TC_ROM)
TARGET_KERNEL_CUSTOM_TOOLCHAIN := $(TARGET_TC_KERNEL)
WITH_LZMA_OTA := false

#SaberMod
-include vendor/bliss/config/sm.mk
endif # Build with BOSP
