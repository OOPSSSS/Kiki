# Kiki
LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

ALL_PREBUILT += $(INSTALLED_KERNEL_TARGET)

-include vendor/nubia/NX404H/nx40x-vendor.mk
