#
# Copyright (C) 2020 Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_PATH := device/realme/spaced

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Parts
$(call inherit-product-if-exists, packages/apps/RealmeParts/parts.mk)

# VNDK
PRODUCT_EXTRA_VNDK_VERSIONS := 30

PRODUCT_SHIPPING_API_LEVEL := 30

# Dynamic Partition
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Audio
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/audio/configs/audio_policy_configuration.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_EXTRA_VNDK_VERSIONS)/etc/audio_policy_configuration.xml

# Dex
PRODUCT_DEXPREOPT_SPEED_APPS += \
    Settings \
    SystemUI

# fastbootd
PRODUCT_PACKAGES += \
    fastbootd

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.1-service.spaced

# Freeform Multiwindow
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.freeform_window_management.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.freeform_window_management.xml

# HIDL
PRODUCT_PACKAGES += \
    libhidltransport \
    libhwbinder \
    libhardware

# Configstore
PRODUCT_PACKAGES += \
    android.hardware.configstore@1.0-service \
    android.hardware.configstore@1.1-service

# ImsInit hack
PRODUCT_PACKAGES += \
    ImsInit

# Init
PRODUCT_PACKAGES += \
    init.mt6781.rc \
    fstab.mt6781 \
    perf_profile.sh

# Keylayouts
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/keylayout/touchpanel.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/touchpanel.kl

# Screen density
PRODUCT_AAPT_CONFIG := xxxhdpi
PRODUCT_AAPT_PREF_CONFIG := xxxhdpi

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-service.spaced

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(DEVICE_PATH)/overlay

# MTK IMS Overlays
PRODUCT_PACKAGES += \
    mtk-ims \
    mtk-ims-telephony

# Permissions
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/permissions/privapp-permissions-mediatek.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-mediatek.xml \
    $(DEVICE_PATH)/permissions/privapp-permissions-spaced.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-spaced.xml \
    $(DEVICE_PATH)/permissions/privapp-permissions-whitelist-system.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-whitelist-system.xml \
    $(DEVICE_PATH)/permissions/privapp-permissions-whitelist-system_ext.xml:$(TARGET_COPY_OUT_SYSTEM)/system_ext/etc/permissions/privapp-permissions-whitelist-system_ext.xml \
    $(DEVICE_PATH)/permissions/privapp-permissions-whitelist-product.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-whitelist-product.xml \
    
# RcsService
PRODUCT_PACKAGES += \
    com.android.ims.rcsmanager \
    RcsService \
    PresencePolling

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH)

# System prop
-include $(DEVICE_PATH)/system.prop
PRODUCT_COMPATIBLE_PROPERTY_OVERRIDE := true

# Symbols
PRODUCT_PACKAGES += \
    libshim_vtservice

PRODUCT_PACKAGES += \
    ImsServiceBase

# Wi-Fi
PRODUCT_PACKAGES += \
    TetheringConfigOverlay \
    WifiOverlay \
    DozeOverlaySystem \
    DozeOverlaySystemUI
    NotchBarKiller

# Call proprietary blob setup
$(call inherit-product, vendor/realme/spaced/spaced-vendor.mk)
$(call inherit-product, vendor/realme/ims-spaced/mtk-ims.mk)
