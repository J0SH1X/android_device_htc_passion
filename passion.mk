#
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

#
# This is the product configuration for a generic GSM passion,
# not specialized for any geography.
#

# First, the most specific values, i.e. the aspects that are specific to GSM

DEVICE_PACKAGE_OVERLAYS := device/htc/passion/overlay

# Properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=240 \
    rild.libpath=/system/lib/libhtc_ril.so \
    ro.ril.ecc.HTC-ELL=92,93,94 \
    ro.ril.ecc.HTC-WWE=999 \
    ro.ril.enable.a52.HTC-ITA=1 \
    ro.ril.enable.a53.HTC-ITA=1 \
    ro.ril.enable.a52=0 \
    ro.ril.enable.a53=1 \
    ro.ril.enable.dtm=1 \
    ro.ril.gprsclass=12 \
    ro.ril.hsdpa.category=8 \
    ro.ril.hsupa.category=5 \
    ro.ril.hsxpa=2 \
    ro.ril.def.agps.mode=2 \
    ro.ril.disable.power.collapse=0 \
    mobiledata.interfaces=rmnet0,rmnet1,rmnet2 \
    ro.media.dec.jpeg.memcap=20000000 \
    ro.opengles.version=131072 \
    ro.telephony.default_network=3 \
    ro.ril.enable.prl.recognition=1 \
    ro.ril.enable.managed.roaming=1 \
    ro.ril.oem.nosim.ecclist=911,112,999,000,08,118,120,122,110,119,995 \
    ro.ril.emc.mode=2 \
    ro.telephony.ril.config=signalstrengthgsm,apptypesim

# Tweaks
PRODUCT_PROPERTY_OVERRIDES += \
    ro.ksm.default=1

# Use swap
PRODUCT_COPY_FILES += \
    device/htc/passion/prebuilt/swap/handle_swap:system/bin/handle_swap.sh

# Disable bootanimation sound
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.silent=1

# Use awesome player instead of nuplayer
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.media.use-awesome=1

# This is needed for the usb workaround
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=charging

#
# Packages required for passion
#

# Camera
PRODUCT_PACKAGES += \
    Snap

# Gello
PRODUCT_PACKAGES += \
    Gello

# Wifi
PRODUCT_PACKAGES += \
    dhcpcd.conf \
    hostapd \
    wpa_supplicant \
    wpa_supplicant.conf \
    libwpa_client \
    libnetcmdiface
    
PRODUCT_COPY_FILES += \
    device/htc/passion/prebuilt/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf

# Sensors
PRODUCT_PACKAGES += \
    gps.mahimahi \
    lights.mahimahi \
    sensors.mahimahi

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_eu_supl.mk)

# Ramdisk
PRODUCT_COPY_FILES += \
    device/htc/passion/rootdir/init.mahimahi.rc:root/init.mahimahi.rc \
    device/htc/passion/rootdir/init.mahimahi.usb.rc:root/init.mahimahi.usb.rc \
    device/htc/passion/rootdir/fstab.passion:root/fstab.passion \
    device/htc/passion/rootdir/ueventd.mahimahi.rc:root/ueventd.mahimahi.rc

# Prebuilt files/configs
PRODUCT_COPY_FILES += \
    device/htc/passion/configs/mahimahi-keypad.kl:system/usr/keylayout/mahimahi-keypad.kl \
    device/htc/passion/configs/mahimahi-keypad.kcm:system/usr/keychars/mahimahi-keypad.kcm \
    device/htc/passion/configs/mahimahi-nav.idc:system/usr/idc/mahimahi-nav.idc \
    device/htc/passion/configs/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    device/htc/passion/configs/h2w_headset.kcm:system/usr/keychars/h2w_headset.kcm \
    device/htc/passion/configs/synaptics-rmi-touchscreen.idc:system/usr/idc/synaptics-rmi-touchscreen.idc \
    device/htc/passion/configs/synaptics-rmi-touchscreen.kl:system/usr/keylayout/synaptics-rmi-touchscreen.kl \
    device/htc/passion/configs/synaptics-rmi-touchscreen.kcm:system/usr/keychars/synaptics-rmi-touchscreen.kcm \
    device/htc/passion/configs/sysctl.conf:system/etc/sysctl.conf

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

# media config xml file
PRODUCT_COPY_FILES += \
    device/htc/passion/configs/media_profiles.xml:system/etc/media_profiles.xml

# Common qsd8k stuff
$(call inherit-product, device/htc/qsd8k-common/qsd8k.mk)

# Also get non-open-source GSM-specific aspects if available
$(call inherit-product-if-exists, vendor/htc/passion/passion-vendor.mk)

# Enable translucent status bar
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.force_highendgfx=true
