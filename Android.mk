# Kiki
NX404H
LOCAL_PATH := $(call my-dir)
ifeq ($(TARGET_DEVICE),device_nx40x)
include $(call all-makefiles-under,$(LOCAL_PATH))
endif
