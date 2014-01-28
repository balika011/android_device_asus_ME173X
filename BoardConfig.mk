#
# Copyright (C) 2011 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# This variable is set first, so it can be overridden
# by BoardConfigVendor.mk
USE_CAMERA_STUB := true

# inherit from the proprietary version
-include vendor/asus/ME173X/BoardConfigVendor.mk

TARGET_BOARD_PLATFORM := mt6589
TARGET_BOOTLOADER_BOARD_NAME := ME173X

TARGET_ARCH := arm
TARGET_CPU_ABI := armeabi
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_CPU_VARIANT := cortex-a7

TARGET_ARCH_VARIANT := armv7-a-neon

#EGL configuration
BOARD_EGL_CFG := device/asus/ME173X/egl.cfg
USE_OPENGL_RENDERER := true

# fix this up by examining /proc/mtd or /proc/emmc on a running device
BOARD_BOOTIMAGE_PARTITION_SIZE := 6291456
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 6291456
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1610612736
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12981370880
BOARD_FLASH_BLOCK_SIZE := 131072


TARGET_PREBUILT_KERNEL := device/asus/ME173X/kernel/kernel

# Set insecure for root access and device specifics
ADDITIONAL_DEFAULT_PROPERTIES += ro.secure=0 \
ro.allow.mock.location=0 \
persist.mtk.aee.aed=on \
ro.debuggable=1 \
persist.service.acm.enable=0 \
persist.sys.usb.config=mass_storage \
ro.mount.fs=EXT4


#General Recovery config

BOARD_HAS_FLIPPED_SCREEN := true
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_RECOVERY_INITRC := device/asus/ME173X/recovery/init.recovery.ME173X.rc
TARGET_RECOVERY_FSTAB := device/asus/ME173X/recovery/etc/recovery.fstab


# Carliv Recovery info
# General MTK Partition info
CWM_EMMC_BOOT_DEVICE_NAME := /dev/bootimg
CWM_EMMC_BOOT_DEVICE_SIZE := 0x00600000
CWM_EMMC_RECOVERY_DEVICE_NAME := /dev/recovery
CWM_EMMC_RECOVERY_DEVICE_SIZE := 0x00600000
CWM_EMMC_UBOOT_DEVICE_NAME := /dev/uboot
CWM_EMMC_UBOOT_DEVICE_SIZE := 0x00060000
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_15x24.h\"

TARGET_RECOVERY_PIXEL_FORMAT := \"RGBX_8888\"
DEVICE_RESOLUTION := 800x1280
TARGET_SCREEN_WIDTH := 800
TARGET_SCREEN_HEIGHT := 1280
BOARD_UMS_LUNFILE := /sys/devices/platform/mt_usb/gadget/lun%d/file

TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/mt_usb/gadget/lun%d/file



