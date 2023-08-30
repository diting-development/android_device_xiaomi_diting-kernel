#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_KERNEL_PATH := device/xiaomi/diting-kernel

BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_KERNEL_BINARIES := kernel
BOARD_RAMDISK_USE_LZ4 := true
BOARD_USES_GENERIC_KERNEL_IMAGE := true
BOARD_VENDOR_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_KERNEL_PATH)/vendor-modules/modules.load))
BOARD_VENDOR_KERNEL_MODULES_BLOCKLIST_FILE := $(DEVICE_KERNEL_PATH)/vendor-modules/modules.blocklist
BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_KERNEL_PATH)/ramdisk-modules/modules.load))
BOARD_VENDOR_RAMDISK_KERNEL_MODULES_BLOCKLIST_FILE := $(DEVICE_KERNEL_PATH)/ramdisk-modules/modules.blocklist
BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_KERNEL_PATH)/ramdisk-modules/modules.load.recovery))
TARGET_FORCE_PREBUILT_KERNEL := true
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_KERNEL_PATH)/prebuilts/dtbo.img
TARGET_PREBUILT_KERNEL := $(DEVICE_KERNEL_PATH)/prebuilts/kernel
TARGET_PREBUILT_DTB := $(DEVICE_KERNEL_PATH)/prebuilts/dtb

PRODUCT_COPY_FILES += \
    $(TARGET_PREBUILT_DTB):$(TARGET_COPY_OUT)/dtb.img \
    $(TARGET_PREBUILT_KERNEL):kernel \
    $(call find-copy-subdir-files,*,$(DEVICE_KERNEL_PATH)/ramdisk-modules/,$(TARGET_COPY_OUT_VENDOR_RAMDISK)/lib/modules) \
    $(call find-copy-subdir-files,*,$(DEVICE_KERNEL_PATH)/vendor-modules/,$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules)
