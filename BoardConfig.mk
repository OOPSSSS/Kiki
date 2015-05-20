#
# Copyright (C) 2014 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

PRODUCT_PREBUILT_WEBVIEWCHROMIUM := yes

LOCAL_PATH := device/ZTE/NX404H

#WITH_DEXPREOPT := true
#DISABLE_PROGUARD := true

BOARD_HAVE_OLD_ION_API := true

PRODUCT_COPY_FILES := $(filter-out frameworks/base/data/keyboards/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
	frameworks/base/data/keyboards/Generic.kl:system/usr/keylayout/Generic.kl \
	frameworks/base/data/keyboards/Generic.kcm:system/usr/keychars/Generic.kcm, $(PRODUCT_COPY_FILES))

PRODUCT_PACKAGES := $(filter-out mount.exfat, $(PRODUCT_PACKAGES))

# Assert
TARGET_OTA_ASSERT_DEVICE := NX404H,nx404h
TARGET_RELEASETOOL_OTA_FROM_TARGET_SCRIPT := device/ZTE/NX404H/releasetools/zte_ota_from_target_files
TARGET_RELEASETOOLS_EXTENSIONS := device/ZTE/NX404H/releasetools

# Kernel
TARGET_KERNEL_SOURCE := kernel/ZTE/NX404H
TARGET_KERNEL_CONFIG := msm8926-nx404h_defconfig  

# Init
#TARGET_INIT_VENDOR_LIB := libinit_msm
TARGET_LIBINIT_DEFINES_FILE := $(LOCAL_PATH)/init/init_NX404H.c 
TARGET_UNIFIED_DEVICE := true

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 12582912  
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 12582912
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1258291200
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1992294400
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_HAS_LARGE_FILESYSTEM := true

# Recovery
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/rootdir/etc/recovery.fstab
BOARD_VENDOR := zte-qcom

TARGET_SPECIFIC_HEADER_PATH := device/ZTE/NX404H/include

# Platform
TARGET_BOARD_PLATFORM := msm8226
TARGET_BOARD_PLATFORM_GPU := qcom-adreno305

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_CPU_VARIANT := krait
ARCH_ARM_HAVE_TLS_REGISTER := true

# Krait optimizations
TARGET_USE_KRAIT_BIONIC_OPTIMIZATION:= true
TARGET_USE_KRAIT_PLD_SET := true
TARGET_KRAIT_BIONIC_PLDOFFS := 10
TARGET_KRAIT_BIONIC_PLDTHRESH := 10
TARGET_KRAIT_BIONIC_BBTHRESH := 64
TARGET_KRAIT_BIONIC_PLDSIZE := 64

TARGET_GLOBAL_CFLAGS += -mtune=cortex-a7 -mfpu=neon-vfpv4 -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a7 -mfpu=neon-vfpv4 -mfloat-abi=softfp

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := MSM8226
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
#TARGET_NO_RECOVERY := true

# Enables Adreno RS driver
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so

# Shader cache config options
# Maximum size of the  GLES Shaders that can be cached for reuse.
# Increase the size if shaders of size greater than 12KB are used.
MAX_EGL_CACHE_KEY_SIZE := 12*1024

# Maximum GLES shader cache size for each app to store the compiled shader
# binaries. Decrease the size if RAM or Flash Storage size is a limitation
# of the device.
MAX_EGL_CACHE_SIZE := 2048*1024

# Kernel
BOARD_KERNEL_CMDLINE := console=null androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x37 
BOARD_KERNEL_BASE := 0x0000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_SEPARATED_DT := true
lnBOARD_MKBOOTIMG_ARGS := --dt device/ZTE/NX404H/dt.img --kernel_offset 0x00008000 --ramdisk_offset 0x02000000 --tags_offset 0x01e00000

WLAN_MODULES:
	mkdir -p $(KERNEL_MODULES_OUT)/pronto
	ln -sf /system/lib/modules/wlan.ko $(TARGET_OUT)/lib/modules/pronto/pronto_wlan.ko

FIRMWARE:
	mkdir -p $(TARGET_OUT)/etc/firmware/wlan/prima/
#	ln -sf /persist/WCNSS_qcom_cfg.ini $(TARGET_OUT)/etc/firmware/wlan/prima/WCNSS_qcom_cfg.ini
	mkdir -p $(TARGET_OUT)/etc/firmware/wcd9306/
	ln -sf /data/misc/audio/mbhc.bin $(TARGET_OUT)/etc/firmware/wcd9306/wcd9306_mbhc.bin
	ln -sf /data/misc/audio/wcd9320_anc.bin $(TARGET_OUT)/etc/firmware/wcd9306/wcd9306_anc.bin
	ln -sf /firmware/image/adsp.b00 $(TARGET_OUT)/etc/firmware/adsp.b00
	ln -sf /firmware/image/adsp.b01 $(TARGET_OUT)/etc/firmware/adsp.b01
	ln -sf /firmware/image/adsp.b02 $(TARGET_OUT)/etc/firmware/adsp.b02
	ln -sf /firmware/image/adsp.b03 $(TARGET_OUT)/etc/firmware/adsp.b03
	ln -sf /firmware/image/adsp.b04 $(TARGET_OUT)/etc/firmware/adsp.b04
	ln -sf /firmware/image/adsp.b05 $(TARGET_OUT)/etc/firmware/adsp.b05
	ln -sf /firmware/image/adsp.b06 $(TARGET_OUT)/etc/firmware/adsp.b06
	ln -sf /firmware/image/adsp.b07 $(TARGET_OUT)/etc/firmware/adsp.b07
	ln -sf /firmware/image/adsp.b08 $(TARGET_OUT)/etc/firmware/adsp.b08
	ln -sf /firmware/image/adsp.b09 $(TARGET_OUT)/etc/firmware/adsp.b09
	ln -sf /firmware/image/adsp.b10 $(TARGET_OUT)/etc/firmware/adsp.b10
	ln -sf /firmware/image/adsp.b11 $(TARGET_OUT)/etc/firmware/adsp.b11
	ln -sf /firmware/image/adsp.b12 $(TARGET_OUT)/etc/firmware/adsp.b12
	ln -sf /firmware/image/adsp.mdt $(TARGET_OUT)/etc/firmware/adsp.mdt
	ln -sf /firmware/image/cmnlib.b00 $(TARGET_OUT)/etc/firmware/cmnlib.b00
	ln -sf /firmware/image/cmnlib.b01 $(TARGET_OUT)/etc/firmware/cmnlib.b01
	ln -sf /firmware/image/cmnlib.b02 $(TARGET_OUT)/etc/firmware/cmnlib.b02
	ln -sf /firmware/image/cmnlib.b03 $(TARGET_OUT)/etc/firmware/cmnlib.b03
	ln -sf /firmware/image/cmnlib.mdt $(TARGET_OUT)/etc/firmware/cmnlib.mdt
	ln -sf /firmware/image/isdbtmm.b00 $(TARGET_OUT)/etc/firmware/isdbtmm.b00
	ln -sf /firmware/image/isdbtmm.b01 $(TARGET_OUT)/etc/firmware/isdbtmm.b01
	ln -sf /firmware/image/isdbtmm.b02 $(TARGET_OUT)/etc/firmware/isdbtmm.b02
	ln -sf /firmware/image/isdbtmm.b03 $(TARGET_OUT)/etc/firmware/isdbtmm.b03
	ln -sf /firmware/image/isdbtmm.mdt $(TARGET_OUT)/etc/firmware/isdbtmm.mdt
	ln -sf /firmware/image/mba.b00 $(TARGET_OUT)/etc/firmware/mba.b00
	ln -sf /firmware/image/mba.mdt $(TARGET_OUT)/etc/firmware/mba.mdt
	ln -sf /firmware/image/mc_v2.b00 $(TARGET_OUT)/etc/firmware/mc_v2.b00
	ln -sf /firmware/image/mc_v2.b01 $(TARGET_OUT)/etc/firmware/mc_v2.b01
	ln -sf /firmware/image/mc_v2.b02 $(TARGET_OUT)/etc/firmware/mc_v2.b02
	ln -sf /firmware/image/mc_v2.b03 $(TARGET_OUT)/etc/firmware/mc_v2.b03
	ln -sf /firmware/image/mc_v2.mdt $(TARGET_OUT)/etc/firmware/mc_v2.mdt
	ln -sf /firmware/image/modem.b00 $(TARGET_OUT)/etc/firmware/modem.b00
	ln -sf /firmware/image/modem.b01 $(TARGET_OUT)/etc/firmware/modem.b01
	ln -sf /firmware/image/modem.b02 $(TARGET_OUT)/etc/firmware/modem.b02
	ln -sf /firmware/image/modem.b03 $(TARGET_OUT)/etc/firmware/modem.b03
	ln -sf /firmware/image/modem.b06 $(TARGET_OUT)/etc/firmware/modem.b06
	ln -sf /firmware/image/modem.b08 $(TARGET_OUT)/etc/firmware/modem.b08
	ln -sf /firmware/image/modem.b09 $(TARGET_OUT)/etc/firmware/modem.b09
	ln -sf /firmware/image/modem.b11 $(TARGET_OUT)/etc/firmware/modem.b11
	ln -sf /firmware/image/modem.b12 $(TARGET_OUT)/etc/firmware/modem.b12
	ln -sf /firmware/image/modem.b13 $(TARGET_OUT)/etc/firmware/modem.b13
	ln -sf /firmware/image/modem.b14 $(TARGET_OUT)/etc/firmware/modem.b14
	ln -sf /firmware/image/modem.b15 $(TARGET_OUT)/etc/firmware/modem.b15
	ln -sf /firmware/image/modem.b16 $(TARGET_OUT)/etc/firmware/modem.b16
	ln -sf /firmware/image/modem.b17 $(TARGET_OUT)/etc/firmware/modem.b17
	ln -sf /firmware/image/modem.b18 $(TARGET_OUT)/etc/firmware/modem.b18
	ln -sf /firmware/image/modem.b19 $(TARGET_OUT)/etc/firmware/modem.b19
	ln -sf /firmware/image/modem.b22 $(TARGET_OUT)/etc/firmware/modem.b22
	ln -sf /firmware/image/modem.b23 $(TARGET_OUT)/etc/firmware/modem.b23
	ln -sf /firmware/image/modem.b24 $(TARGET_OUT)/etc/firmware/modem.b24
	ln -sf /firmware/image/modem.b25 $(TARGET_OUT)/etc/firmware/modem.b25
	ln -sf /firmware/image/modem.mdt $(TARGET_OUT)/etc/firmware/modem.mdt
	ln -sf /firmware/image/playread.b00 $(TARGET_OUT)/etc/firmware/playread.b00
	ln -sf /firmware/image/playread.b01 $(TARGET_OUT)/etc/firmware/playread.b01
	ln -sf /firmware/image/playread.b02 $(TARGET_OUT)/etc/firmware/playread.b02
	ln -sf /firmware/image/playread.b03 $(TARGET_OUT)/etc/firmware/playread.b03
	ln -sf /firmware/image/playread.mdt $(TARGET_OUT)/etc/firmware/playread.mdt
	ln -sf /firmware/image/venus.b01 $(TARGET_OUT)/etc/firmware/venus.b01
	ln -sf /firmware/image/venus.b02 $(TARGET_OUT)/etc/firmware/venus.b02
	ln -sf /firmware/image/venus.b03 $(TARGET_OUT)/etc/firmware/venus.b03
	ln -sf /firmware/image/venus.b04 $(TARGET_OUT)/etc/firmware/venus.b04
	ln -sf /firmware/image/venus.mdt $(TARGET_OUT)/etc/firmware/venus.mdt
	ln -sf /firmware/image/wcnss.b00 $(TARGET_OUT)/etc/firmware/wcnss.b00
	ln -sf /firmware/image/wcnss.b01 $(TARGET_OUT)/etc/firmware/wcnss.b01
	ln -sf /firmware/image/wcnss.b02 $(TARGET_OUT)/etc/firmware/wcnss.b02
	ln -sf /firmware/image/wcnss.b04 $(TARGET_OUT)/etc/firmware/wcnss.b04
	ln -sf /firmware/image/wcnss.b06 $(TARGET_OUT)/etc/firmware/wcnss.b06
	ln -sf /firmware/image/wcnss.b07 $(TARGET_OUT)/etc/firmware/wcnss.b07
	ln -sf /firmware/image/wcnss.b08 $(TARGET_OUT)/etc/firmware/wcnss.b08
	ln -sf /firmware/image/wcnss.b09 $(TARGET_OUT)/etc/firmware/wcnss.b09
	ln -sf /firmware/image/wcnss.mdt $(TARGET_OUT)/etc/firmware/wcnss.mdt
	ln -sf /firmware/image/widevine.b00 $(TARGET_OUT)/etc/firmware/widevine.b00
	ln -sf /firmware/image/widevine.b01 $(TARGET_OUT)/etc/firmware/widevine.b01
	ln -sf /firmware/image/widevine.b02 $(TARGET_OUT)/etc/firmware/widevine.b02
	ln -sf /firmware/image/widevine.b03 $(TARGET_OUT)/etc/firmware/widevine.b03
	ln -sf /firmware/image/widevine.mdt $(TARGET_OUT)/etc/firmware/widevine.mdt	
	
TARGET_KERNEL_MODULES += WLAN_MODULES FIRMWARE

#Ant
#should be qualcomm-uart
 BOARD_ANT_WIRELESS_DEVICE := "vfs-prerelease"

# Audio
AUDIO_FEATURE_DISABLED_ANC_HEADSET := true
AUDIO_FEATURE_DISABLED_DS1_DOLBY_DDP := true
AUDIO_FEATURE_DISABLED_SSR := true
BOARD_USES_FLUENCE_INCALL := true
BOARD_USES_ALSA_AUDIO := true
BOARD_HAVE_QCOM_FM := true
TARGET_QCOM_AUDIO_VARIANT := caf

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
QCOM_BT_USE_SMD_TTY := true

# BOARD_HAVE_BLUETOOTH_QCOM := true

# Camera
USE_DEVICE_SPECIFIC_CAMERA := true

# CMHW
BOARD_HARDWARE_CLASS := $(LOCAL_PATH)/cmhw/

# Display
BOARD_EGL_CFG := $(LOCAL_PATH)/etc/egl.cfg
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
TARGET_QCOM_DISPLAY_VARIANT := caf-new 
TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_ION := true
TARGET_USE_QCOM_BIONIC_OPTIMIZATION := true
USE_OPENGL_RENDERER := true

# Enable WEBGL in WebKit
ENABLE_WEBGL := true

# Webkit
TARGET_FORCE_CPU_UPLOAD := true

# Encryption
TARGET_HW_DISK_ENCRYPTION := true

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Gps
# TARGET_PROVIDES_GPS_LOC_API := false
# TARGET_NO_RPC := true
# BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := 

# Media
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true
TARGET_QCOM_MEDIA_VARIANT := caf-new 

# Power
TARGET_POWERHAL_VARIANT := qcom

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_HAS_LARGE_FILESYSTEM := true

# Qualcomm support
COMMON_GLOBAL_CFLAGS += -DQCOM_BSP
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE
BOARD_USES_QCOM_HARDWARE := true
TARGET_USES_QCOM_BSP := true
USE_DEVICE_SPECIFIC_QCOM_PROPRIETARY:= true

# Recovery
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_RECOVERY_SWIPE := true
BOARD_SUPPRESS_EMMC_WIPE := true
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_15x24.h\"
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_USERIMAGES_USE_EXT4 := true

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
    nfc.te \
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

# Time services
BOARD_USES_QC_TIME_SERVICES := true

# Vold
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
BOARD_VOLD_MAX_PARTITIONS := 40
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun%d/file

# Wifi
TARGET_USES_WCNSS_CTRL := true
BOARD_HAS_QCOM_WLAN := true
BOARD_WLAN_DEVICE := qcwcn
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_qcwcn
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_qcwcn
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/wlan.ko"
WIFI_DRIVER_MODULE_NAME := "wlan"
WPA_SUPPLICANT_VERSION := VER_0_8_X

# inherit from the proprietary version
-include vendor/ZTE/NX404H/BoardConfigVendor.mk

PRODUCT_BOOT_JARS := $(subst $(space),:,$(PRODUCT_BOOT_JARS))
