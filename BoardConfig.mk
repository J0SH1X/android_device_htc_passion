# Copyright (C) 2009 The Android Open Source Project
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
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).
USE_CAMERA_STUB := true

# Inherit from the proprietary version
-include vendor/htc/passion/BoardConfigVendor.mk
# inherit common defines for all qsd8k devices
include device/htc/qsd8k-common/BoardConfigCommon.mk

TARGET_BOOTLOADER_BOARD_NAME := mahimahi

# Kernel
BOARD_KERNEL_CMDLINE    := androidboot_selinux=permissive no_console_suspend=1 wire.search_count=5
#console=ttyMSM0,115200n8
BOARD_KERNEL_BASE       := 0x20000000
BOARD_KERNEL_NEW_PPPOX  := true

TARGET_KERNEL_CONFIG    := evervolv_mahimahi_defconfig

TARGET_RECOVERY_FSTAB := device/htc/passion/fstab.bravo

# GPS HAL and AMSS version
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := mahimahi
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 3200

# Hacks
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/usb_mass_storage/lun0/file
BOARD_USE_LEGACY_TRACKPAD       := true
BOARD_USE_LEGACY_TOUCHSCREEN    := true
BOARD_HAVE_PRE_KITKAT_AUDIO_POLICY_BLOB := true

#Slim down fonts
REMOVE_PRODUCT_PACKAGES += NotoSansSC-Regular.otf NotoSansJP-Regular.otf NotoSansTC-Regular.otf

#Slim down Packages
REMOVE_PRODUCT_PACKAGES += CMUpdater CyanogenSetupWizard PhotoTable PhotoPhase PhaseBeam HoloSpiralWallpaper LiveWallpapers

# Bootanimation
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true

#ART
WITH_DEXPREOPT := true
WITH_DEXPREOPT_BOOT_IMG_ONLY := true
MALLOC_SVELTE := true
TARGET_CPU_SMP := false

# Boot:     0x00380000 3.5 MB (reduced to 3.0 #3.25)
# Recovery: 0x00400000 4 MB
# System:   0x10400000 260 MB
# Userdata: 0x0a840000 168.25 MB
#BOARD_BOOTIMAGE_PARTITION_SIZE := 3145728 #3407872 #3670016
                                     #FIXME had to bump for twrp
#BOARD_RECOVERYIMAGE_PARTITION_SIZE := 7921664 #ca. 8M
#BOARD_SYSTEMIMAGE_PARTITION_SIZE := 272629760
#BOARD_USERDATAIMAGE_PARTITION_SIZE := 176422912
#BOARD_FLASH_BLOCK_SIZE := 131072

BLOCK_BASED_OTA := false


# Recovery
TARGET_RECOVERY_FSTAB   := device/htc/passion/fstab.mahimahi

# TWRP Flags
DEVICE_RESOLUTION := 480x800
BOARD_HAS_NO_REAL_SDCARD := true
TW_EXCLUDE_SU := true
TW_EXCLUDE_ENCRYPTED_BACKUPS := true
TW_NO_SCREEN_BLANK := true
TW_USE_TOOLBOX := true
HAVE_SELINUX := true

#SElinux
include device/qcom/sepolicy/sepolicy.mk
