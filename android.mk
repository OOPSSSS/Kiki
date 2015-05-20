# Kiki
NX404H
LOCAL_PATH := $(call my-dir)
ifeq ($(TARGET_DEVICE),v5.2.1)
include $(call all-makefiles-under,$(LOCAL_PATH))
endif
