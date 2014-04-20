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

TARGET_SPECIFIC_HEADER_PATH := device/asus/ME173X/include
# inherit from the proprietary version
-include vendor/asus/ME173X/BoardConfigVendor.mk

TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := mt6589

TARGET_ARCH := arm
TARGET_CPU_ABI := armeabi
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_CPU_VARIANT := cortex-a7

TARGET_ARCH_VARIANT := armv7-a-neon

ARCH_ARM_HAVE_TLS_REGISTER := true
ARCH_ARM_HAVE_NEON := true

# Wifi related defines
WIFI_DRIVER_MODULE_PATH          := /system/lib/modules/
WIFI_DRIVER_MODULE_NAME          := wlan
BOARD_WPA_SUPPLICANT_DRIVER := WEXT
BOARD_P2P_SUPPLICANT_DRIVER := NL80211
HAVE_CUSTOM_WIFI_DRIVER_2 := true
HAVE_INTERNAL_WPA_SUPPLICANT_CONF := true
HAVE_CUSTOM_WIFI_HAL := mediatek
WPA_SUPPLICANT_VERSION := VER_0_6_X
P2P_SUPPLICANT_VERSION := VER_0_8_X

BOARD_HAVE_BLUETOOTH  := true

#EGL configuration
BOARD_EGL_CFG := device/asus/ME173X/egl.cfg
USE_OPENGL_RENDERER := true

TARGET_KMODULES := true

# eMMC support
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := false

BOARD_KERNEL_CMDLINE := console=ttyMT3,921600n1 vmalloc=530M slub_max_order=0 lcm=1-lgld070wx3_dsi_vdo fps=5588 lcm_type=1 pl_t=390 lk_t=1465 printk.disable_uart=1 boot_reason=4

#BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE := 2048

# Filesystem
# fix this up by examining /proc/mtd or /proc/emmc on a running device
# /proc/dumchar_info for MTK devices
BOARD_PROTECT_FIMAGE_PARTITION_SIZE := 10485760
BOARD_PROTECT_SIMAGE_PARTITION_SIZE := 10485760
BOARD_SECROIMAGE_PARTITION_SIZE := 6291456
BOARD_BOOTIMAGE_PARTITION_SIZE := 6291456
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 6291456
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 681574400
BOARD_CACHEIMAGE_PARTITION_SIZE :=132120576
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1072693248
BOARD_FATIMAGE_PARTITION_SIZE :=0M

BOARD_FLASH_BLOCK_SIZE := 512

TARGET_PREBUILT_KERNEL := device/asus/ME173X/kernel/kernel

# Set insecure for root access and device specifics
ADDITIONAL_DEFAULT_PROPERTIES += ro.secure=0 \
ro.allow.mock.location=0 \
persist.mtk.aee.aed=on \
ro.debuggable=1 \
persist.service.acm.enable=0 \
ro.mount.fs=EXT4


#General Recovery config

BOARD_HAS_FLIPPED_SCREEN := true

BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_RECOVERY_INITRC := device/asus/ME173X/recovery/init.recovery.ME173X.rc
TARGET_RECOVERY_FSTAB := device/asus/ME173X/recovery/etc/recovery.fstab


#MTK specifics

MTK := true
COMMON_GLOBAL_CFLAGS += -DMTK
COMMON_GLOBAL_CPPFLAGS += -DMTK

MTK_PLATFORM := MT6589

MTK_WLAN_SUPPORT := yes
MTK_AAL_SUPPORT := yes
HAVE_AEE_FEATURE := yes

BOARD_USES_ARGB8888_FB := true
BOARD_ENABLE_MFG_HARDWARE := true

MFG_HALCOMPOSITION_BYPASS := false

MFG_ENABLE_GRALLOC_PMEM := true
BOARD_USES_YUSU_MP3_PROPRIETARY_CODEC := true
BOARD_USES_6575_HW := true
BOARD_USES_6575_HW := true
BOARD_USES_MTK_JPEG_HW_DECODER := true
BOARD_USES_YUSU_LCD_HW_OVERLAY := true

USES_MTK_OMX_CORE := true
USES_CACHE_PMEM := true
BOARD_USES_ANDROID_DEFAULT_CODE := false
BOARD_USES_6575_MFV_HW := true
BOARD_USES_MTK_VPX_DEC := true

MTK_SHARED_SDCARD := yes
MTK_EMMC_SUPPORT := yes
MTK_BICR_SUPPORT := yes

MTK_MMUMAP_SUPPORT := false
HAVE_XLOG_FEATURE := yes
MTK_MTKLOGGER_SUPPORT = yes

CUSTOM_UBOOT_LCM := lgld070wx3_dsi_vdo nt35521_dsi_vdo
MTK_KERNEL_POWER_OFF_CHARGING := yes
MTK_LCM_PHYSICAL_ROTATION := 180

ifeq ($(strip $(MTK_NAND_PAGE_SIZE)), 4K)
  BOARD_NAND_PAGE_SIZE := 4096 
  BOARD_NAND_SPARE_SIZE := 128
else
  BOARD_NAND_PAGE_SIZE := 2048  # default 2K
  BOARD_NAND_SPARE_SIZE := 64
endif

TARGET_NO_FACTORYIMAGE := true
# Audio blobs
COMMON_GLOBAL_CFLAGS += -DMR1_AUDIO_BLOB -DDISABLE_HW_ID_MATCH_CHECK

BOARD_USES_MTK_AUDIO := true

# ME173X Touch
TOUCH_180 := true
COMMON_GLOBAL_CPPFLAGS += -DTOUCH_180
COMMON_GLOBAL_CFLAGS += -DTOUCH_180

# MTK, Baochu Wang, 20101130, Add A-GPS {
   BOARD_AGPS_SUPL_LIBRARIES := true

  BOARD_GPS_LIBRARIES := true


# General MTK Recovery Partition info
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



BOARD_CUSTOM_BOOTIMG_MK := device/asus/ME173X/custombootimg.mk

# Releasetools
TARGET_PROVIDES_RELEASETOOLS := true
TARGET_RELEASETOOL_IMG_FROM_TARGET_SCRIPT := ./device/asus/ME173X/releasetools/ME173X_img_from_target_files
TARGET_RELEASETOOL_OTA_FROM_TARGET_SCRIPT := ./device/asus/ME173X/releasetools/ME173X_ota_from_target_files

