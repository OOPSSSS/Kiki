# Kiki
NX404H
LOCAL_PATH := device/nubia/NX404H

# inherit from the proprietary version
-include vendor/nubia/NX404H/BoardConfigVendor.mk

TARGET_SPECIFIC_HEADER_PATH := device/nubia/NX404H/include

# Assert
TARGET_OTA_ASSERT_DEVICE := device_nx40x

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := MSM8226
TARGET_NO_BOOTLOADER := true

# Platform
TARGET_BOARD_PLATFORM := msm8226
TARGET_BOARD_PLATFORM_GPU := qcom-adreno305

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_CPU_VARIANT := cortex-a7
ARCH_ARM_HAVE_TLS_REGISTER := true

# Flags
TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp



BOARD_HAS_QCOM_WLAN := true
BOARD_WLAN_DEVICE := qcwcn
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_qcwcn
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_qcwcn
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/wlan.ko"
WIFI_DRIVER_MODULE_NAME := "wlan"
WPA_SUPPLICANT_VERSION := VER_0_8_X

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
BLUETOOTH_HCI_USE_MCT := true

# Qualcomm support
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE
COMMON_GLOBAL_CFLAGS += -DQCOM_BSP
BOARD_USES_QCOM_HARDWARE := true
TARGET_USES_QCOM_BSP := true

# Display
BOARD_EGL_CFG := $(LOCAL_PATH)/prebuilt/lib/egl/egl.cfg
TARGET_QCOM_DISPLAY_VARIANT := caf
TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_ION := true
USE_OPENGL_RENDERER := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
MAX_EGL_CACHE_KEY_SIZE := 12*2048
MAX_EGL_CACHE_SIZE := 2048*1024

# Audio
BOARD_USES_ALSA_AUDIO := true
TARGET_QCOM_AUDIO_VARIANT := caf
AUDIO_FEATURE_DISABLED_ANC_HEADSET := true
AUDIO_FEATURE_DISABLED_DS1_DOLBY_DDP := true

# Media
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true
TARGET_QCOM_MEDIA_VARIANT := caf

# FM
BOARD_HAVE_QCOM_FM := true

# Time services
BOARD_USES_QC_TIME_SERVICES := true

# Power
TARGET_POWERHAL_VARIANT := qcom

# Enable suspend during charger mode
BOARD_CHARGER_ENABLE_SUSPEND := true

# Camera
USE_DEVICE_SPECIFIC_CAMERA := true

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x1000000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x1000000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 838860800
BOARD_CACHEIMAGE_PARTITION_SIZE := 402653184
BOARD_USERDATAIMAGE_PARTITION_SIZE := 6241112064
BOARD_FLASH_BLOCK_SIZE := 131072

# Vold
BOARD_VOLD_DISC_HAS_MULTIPLE_MAJORS := true
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
BOARD_VOLD_MAX_PARTITIONS := 40
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun%d/file

# Recovery
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_USES_MMCUTILS := true

TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/rootdir/fstab.qcom
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_15x24.h\"
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"

# SELinux
BOARD_SEPOLICY_DIRS += \
    $(LOCAL_PATH)/sepolicy

BOARD_SEPOLICY_UNION += \
    adbd.te \
    app.te \
    bluetooth_loader.te \
    bridge.te \
    camera.te \
    device.te \
    dhcp.te \
    dnsmasq.te \
    domain.te \
    drmserver.te \
    file_contexts \
    file.te \
    hostapd.te \
    init_shell.te \
    init.te \
    libqc-opt.te \
    mediaserver.te \
    mpdecision.te \
    netd.te \
    netmgrd.te \
    property_contexts \
    property.te \
    qcom.te \
    qmux.te \
    radio.te \
    rild.te \
    rmt.te \
    sdcard_internal.te \
    sdcardd.te \
    sensors.te \
    shell.te \
    surfaceflinger.te \
    system.te \
    tee.te \
    te_macros \
    thermald.te \
    ueventd.te \
    vold.te \
    wpa_supplicant.te \
    zygote.te

ifneq ($(TARGET_BUILD_VARIANT),user)
    BOARD_SEPOLICY_UNION += su.te
endif
