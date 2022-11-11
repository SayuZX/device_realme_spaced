#
# Copyright (C) 2021 Android Open Source Project
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

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from device makefile
$(call inherit-product, device/realme/spaced/device.mk)

# Inherit some common CherishOS stuff.
$(call inherit-product, vendor/aosp/config/common.mk)
TARGET_SUPPORTS_QUICK_TAP := true
TARGET_BOOT_ANIMATION_RES := 1080
TARGET_FACE_UNLOCK_SUPPORTED := true

# b/189477034: Bypass build time check on uses_libs until vendor fixes all their apps
PRODUCT_BROKEN_VERIFY_USES_LIBRARIES := true
RELAX_USES_LIBRARY_CHECK := true

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := aosp_spaced
PRODUCT_DEVICE := spaced
PRODUCT_BRAND := realme
PRODUCT_MODEL := Realme G96 Series
PRODUCT_MANUFACTURER := realme

# Build info
BUILD_FINGERPRINT := "google/coral/coral:12/SQ3A.220705.003.A1/8672226:user/release-keys"
PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE=spaced \
    PRODUCT_NAME=spaced \
    PRIVATE_BUILD_DESC="sys_oplus_mssi_64_cn-user-11-RP1A.200720.011-mp8tc16sppr10V1-release-keys"

PRODUCT_GMS_CLIENTID_BASE := android-realme
