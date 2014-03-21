$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/asus/ME173X/ME173X-vendor.mk)

# include all config files
$(call inherit-product-if-exists, include device/asus/ME173X/configs/*.mk)

DEVICE_PACKAGE_OVERLAYS += device/asus/ME173X/overlay

LOCAL_PATH := device/asus/ME173X
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

#PRODUCT_COPY_FILES += \
#    $(LOCAL_PATH)/recovery/sec.ko:recovery/root/sec.ko 

PRODUCT_PROPERTY_OVERRIDES := \
    wifi.supplicant_scan_interval=15 \
    drm.service.enabled=true

#PRODUCT_PROPERTY_OVERRIDES += \
#    ro.telephony.ril_class=MediaTekRIL

include frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk

#  Init scripts
PRODUCT_COPY_FILES += \
    device/asus/ME173X/root/custom_build_verno:root/custom_build_verno \
    device/asus/ME173X/root/fstab.mt8125:root/fstab.mt8125 \
    device/asus/ME173X/root/init.modem.rc:root/init.modem.rc \
    device/asus/ME173X/root/init.mt8125.usb.rc:root/init.mt8125.usb.rc \
    device/asus/ME173X/root/init.mt8125.rc:root/init.mt8125.rc \
    device/asus/ME173X/root/init.goldfish.rc:root/init.goldfish.rc \
    device/asus/ME173X/root/sbin/e2fsck:root/sbin/e2fsck \
    device/asus/ME173X/root/sbin/getserialno:root/sbin/getserialno \
    device/asus/ME173X/root/sbin/meta_tst:root/sbin/meta_tst \
    device/asus/ME173X/root/sbin/tune2fs:root/sbin/tune2fs \
    device/asus/ME173X/root/ueventd.mt8125.rc:root/ueventd.mt8125.rc

PRODUCT_COPY_FILES += \
    device/asus/ME173X/modules/texfat.ko:system/lib/modules/texfat.ko \
    device/asus/ME173X/modules/tntfs.ko:system/lib/modules/tntfs.ko \
    device/asus/ME173X/modules/devapc.ko:system/lib/modules/devapc.ko \
    device/asus/ME173X/modules/devinfo.ko:system/lib/modules/devinfo.ko \
    device/asus/ME173X/modules/hid-logitech-dj.ko:system/lib/modules/hid-logitech-dj.ko \
    device/asus/ME173X/modules/mtk_hif_sdio.ko:system/lib/modules/mtk_hif_sdio.ko \
    device/asus/ME173X/modules/mtklfb.ko:system/lib/modules/mtklfb.ko \
    device/asus/ME173X/modules/mtk_stp_bt.ko:system/lib/modules/mtk_stp_bt.ko \
    device/asus/ME173X/modules/mtk_stp_gps.ko:system/lib/modules/mtk_stp_gps.ko \
    device/asus/ME173X/modules/mtk_stp_uart.ko:system/lib/modules/mtk_stp_uart.ko \
    device/asus/ME173X/modules/mtk_stp_wmt.ko:system/lib/modules/mtk_stp_wmt.ko \
    device/asus/ME173X/modules/mtk_wmt_wifi.ko:system/lib/modules/mtk_wmt_wifi.ko \
    device/asus/ME173X/modules/pvrsrvkm.ko:system/lib/modules/pvrsrvkm.ko \
    device/asus/ME173X/modules/scsi_tgt.ko:system/lib/modules/scsi_tgt.ko \
    device/asus/ME173X/modules/scsi_wait_scan.ko:system/lib/modules/scsi_wait_scan.ko \
    device/asus/ME173X/modules/sec.ko:system/lib/modules/sec.ko \
    device/asus/ME173X/modules/vcodec_kernel_driver.ko:system/lib/modules/vcodec_kernel_driver.ko \
    device/asus/ME173X/modules/wlan.ko:system/lib/modules/wlan.ko \
    device/asus/ME173X/modules/wlan_mt6628.ko:system/lib/modules/wlan_mt6628.ko

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml

PRODUCT_PACKAGES := \
    audio.primary.default \
    audio.a2dp.default \
    audio.usb.default \
    camera.default \
    gps.default \
    keystore.default \
    hwcomposer.mt8125 \
    libaudio.usb.default \
    lights.mt8125 \
    local_time.default \
    power.default \
    sensors.default \
    librs_jni \
    setup_fs \
    l2ping \
    hcitool \
    bttest \
    com.android.future.usb.accessory


# Set region
PRODUCT_DEFAULT_LANGUAGE := en_US
PRODUCT_DEFAULT_REGION := US

# High-density art, but English locale
PRODUCT_LOCALES += en_US hdpi
PRODUCT_AAPT_CONFIG := normal large tvdpi hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

WIFI_BAND := 802_11_BG
# $(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4330/device-bcm.mk)

$(call inherit-product, build/target/product/full_base.mk)

