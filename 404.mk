# Kiki
NX404H
$(call inherit-product, vendor/ZteRed/V5.2.1/oopssss.mk)
LOCAL_PATH := device/ZteRed/V5.2.1
PRODUCT_AAPT_CONFIG :=ldpi mdpi hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_COPY_FILES += \
$(LOCAL_PATH)/zImage:kernel
PRODUCT_PACKAGES += \
	Phone \
 TelephonyProvider \
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
