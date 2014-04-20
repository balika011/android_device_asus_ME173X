#
# Copyright (C) 2013 The Android Open-Source Project
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

MKIMAGE := device/asus/ME173X/mkimage

$(INSTALLED_BOOTIMAGE_TARGET):
	$(MKBOOTIMG) $(INSTALLED_RAMDISK_TARGET) $(INSTALLED_KERNEL_TARGET)
	$(call pretty,"Boot image: $@")
	$(hide) $(MKIMAGE) $(INSTALLED_KERNEL_TARGET) KERNEL > $(INSTALLED_KERNEL_TARGET).mtk
	$(hide) $(MKIMAGE) $(INSTALLED_RAMDISK_TARGET) RECOVERY > $(INSTALLED_RAMDISK_TARGET).mtk
	$(hide) $(MKBOOTIMG) --kernel $(INSTALLED_KERNEL_TARGET).mtk --ramdisk $(INSTALLED_RAMDISK_TARGET).mtk -o $@
	$(hide) $(call assert-max-image-size, $@, $(BOARD_BOOTIMAGE_PARTITION_SIZE), raw)

$(INSTALLED_RECOVERYIMAGE_TARGET):
	$(MKBOOTIMG) $(recovery_ramdisk) $(recovery_kernel)
	$(call pretty,"Recovery image: $@")
	$(hide) $(MKIMAGE) $(recovery_kernel) KERNEL > $(recovery_kernel).mtk
	$(hide) $(MKIMAGE) $(recovery_ramdisk) RECOVERY > $(recovery_ramdisk).mtk
	$(hide) $(MKBOOTIMG) --kernel $(recovery_kernel).mtk --ramdisk $(recovery_ramdisk).mtk -o $@
	$(hide) $(call assert-max-image-size, $@, $(BOARD_RECOVERYIMAGE_PARTITION_SIZE), raw)